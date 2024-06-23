package com.chocoshop.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.chocoshop.model.dto.CartItemDto;
import com.chocoshop.model.dto.ProductDto;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping
    public String viewCart(Model model) {
        String sql = "SELECT * FROM products";
        List<ProductDto> products = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ProductDto.class));
        model.addAttribute("products", products);

        sql = "SELECT * FROM cart_items WHERE customer_id = 1";  // 假設顧客ID為1
        List<CartItemDto> cartItems = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(CartItemDto.class));
        model.addAttribute("cartItems", cartItems);

        double totalAmount = cartItems.stream().mapToDouble(CartItemDto::getTotalPrice).sum();
        model.addAttribute("totalAmount", totalAmount);

        return "cart";
    }

    @PostMapping("/add")
    public String addToCart(@RequestParam int customerId, @RequestParam int productId, @RequestParam double price, @RequestParam int quantity) {
        // 添加日誌
        System.out.println("Add to cart - customerId: " + customerId + ", productId: " + productId + ", price: " + price + ", quantity: " + quantity);

        String sql = "INSERT INTO cart_items (customer_id, product_id, price, quantity) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, customerId, productId, price, quantity);
        return "redirect:/cart?customerId=" + customerId;
    }


    @PostMapping("/remove")
    public String removeFromCart(@RequestParam int customerId, @RequestParam int productId) {
        String sql = "DELETE FROM cart_items WHERE customer_id = ? AND product_id = ?";
        jdbcTemplate.update(sql, customerId, productId);
        return "redirect:/cart?customerId=" + customerId;
    }

    @PostMapping("/checkout")
    public String checkout(@RequestParam int customerId) {
        double totalAmount = 0;

        String sql = "SELECT * FROM cart_items WHERE customer_id = ?";
        List<CartItemDto> cartItems = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(CartItemDto.class), customerId);

        sql = "INSERT INTO orders (customer_id, total_price) VALUES (?, ?)";
        jdbcTemplate.update(sql, customerId, totalAmount);

        int orderId = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);

        for (CartItemDto item : cartItems) {
            totalAmount += item.getTotalPrice();
            sql = "INSERT INTO order_items (order_id, product_id, quantity, total_price) VALUES (?, ?, ?, ?)";
            jdbcTemplate.update(sql, orderId, item.getProductId(), item.getQuantity(), item.getTotalPrice());
        }

        sql = "UPDATE orders SET total_price = ? WHERE order_id = ?";
        jdbcTemplate.update(sql, totalAmount, orderId);

        sql = "DELETE FROM cart_items WHERE customer_id = ?";
        jdbcTemplate.update(sql, customerId);

        return "redirect:/cart?customerId=" + customerId;
    }
}
