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
        return "cart";  // 返回購物車頁面
    }

    @GetMapping("/list")
    @ResponseBody
    public List<ProductDto> getProducts() {
        String sql = "SELECT * FROM products";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ProductDto.class));
    }

    @PostMapping("/add")
    @ResponseBody
    public String addToCart(@RequestBody CartItemDto cartItem) {
        cartItem.setTotalPrice(cartItem.getPrice() * cartItem.getQuantity());
        
        // 添加日誌
        System.out.println("Add to cart: " + cartItem);

        String sql = "INSERT INTO cart_items (customer_id, product_id, price, quantity, total_price) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, cartItem.getCustomerId(), cartItem.getProductId(), cartItem.getPrice(), cartItem.getQuantity(), cartItem.getTotalPrice());
        return "{\"success\": true}";
    }

    @PostMapping("/remove")
    @ResponseBody
    public String removeFromCart(@RequestBody CartItemDto cartItem) {
        String sql = "DELETE FROM cart_items WHERE customer_id = ? AND product_id = ?";
        jdbcTemplate.update(sql, cartItem.getCustomerId(), cartItem.getProductId());
        return "{\"success\": true}";
    }

    @PostMapping("/checkout")
    @ResponseBody
    public String checkout(@RequestBody Map<String, Integer> request) {
        int customerId = request.get("customerId");
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

        return "{\"success\": true}";
    }
}
