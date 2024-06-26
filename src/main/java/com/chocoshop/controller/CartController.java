package com.chocoshop.controller;

import com.chocoshop.model.dto.CartItemDto;
import com.chocoshop.model.dto.ProductDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

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

        sql = "SELECT c.*, p.name as productName FROM cart_items c JOIN products p ON c.product_id = p.product_id";
        List<CartItemDto> cartItems = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(CartItemDto.class));
        model.addAttribute("cartItems", cartItems);

        double totalAmount = cartItems.stream().mapToDouble(CartItemDto::getTotalPrice).sum();
        model.addAttribute("totalAmount", totalAmount);

        return "cart";
    }

    @PostMapping("/add")
    public String addToCart(@RequestParam int productId, @RequestParam double price, @RequestParam int quantity) {
        System.out.println("Add to cart - productId: " + productId + ", price: " + price + ", quantity: " + quantity);

        String sql = "INSERT INTO cart_items (product_id, price, quantity, total_price) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, productId, price, quantity, price * quantity);
        return "redirect:/cart";
    }

    @PostMapping("/remove")
    public String removeFromCart(@RequestParam int productId) {
        String sql = "DELETE FROM cart_items WHERE product_id = ?";
        jdbcTemplate.update(sql, productId);
        return "redirect:/cart";
    }

    @PostMapping("/checkout")
    public String checkout(Model model) {
        String sql = "SELECT c.*, p.name as productName FROM cart_items c JOIN products p ON c.product_id = p.product_id";
        List<CartItemDto> cartItems = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(CartItemDto.class));
        model.addAttribute("cartItems", cartItems);

        double totalAmount = cartItems.stream().mapToDouble(CartItemDto::getTotalPrice).sum();
        model.addAttribute("totalAmount", totalAmount);

        return "cart";
    }

    @PostMapping("/confirm")
    public String confirmPurchase(
            @RequestParam String name,
            @RequestParam String phone,
            @RequestParam String email,
            @RequestParam String paymentMethod,
            @RequestParam String deliveryDate,
            Model model) {

        LocalDateTime purchaseDateTime = LocalDateTime.now();

        List<CartItemDto> cartItems = jdbcTemplate.query("SELECT * FROM cart_items", new BeanPropertyRowMapper<>(CartItemDto.class));

        double totalAmount = cartItems.stream().mapToDouble(CartItemDto::getTotalPrice).sum();

        model.addAttribute("name", name);
        model.addAttribute("phone", phone);
        model.addAttribute("email", email);
        model.addAttribute("paymentMethod", paymentMethod);
        model.addAttribute("deliveryDate", deliveryDate);
        model.addAttribute("purchaseDateTime", purchaseDateTime);
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("totalAmount", totalAmount);

        new Thread(() -> {
            try {
                Thread.sleep(10000);

                String sql = "INSERT INTO orders (name, phone, email, payment_method, delivery_date, purchase_date, total_price) VALUES (?, ?, ?, ?, ?, ?, ?)";
                jdbcTemplate.update(sql, name, phone, email, paymentMethod, deliveryDate, purchaseDateTime, totalAmount);

                int orderId = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);

                for (CartItemDto item : cartItems) {
                    sql = "INSERT INTO order_items (order_id, product_id, quantity, total_price) VALUES (?, ?, ?, ?)";
                    jdbcTemplate.update(sql, orderId, item.getProductId(), item.getQuantity(), item.getTotalPrice());
                }

                jdbcTemplate.update("DELETE FROM cart_items");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }).start();

        return "thankYou";
    }

    @GetMapping("/clear")
    public String clearCart() {
        String sql = "DELETE FROM cart_items";
        jdbcTemplate.update(sql);
        return "redirect:/cart";
    }
}
