package com.chocoshop.controller;

import com.chocoshop.model.dto.CartItemDto;
import com.chocoshop.model.dto.OrderDto;
import com.chocoshop.model.dto.OrderItemDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping
    public String viewCart(HttpSession session, Model model) {
        Integer customerId = (Integer) session.getAttribute("customerId");
        if (customerId == null) {
            return "redirect:/login"; // 如果 session 中沒有 customerId，重定向到登入頁面
        }

        String sql = "SELECT ci.id, ci.quantity, p.name, p.price FROM cart_items ci JOIN products p ON ci.product_id = p.id WHERE ci.customer_id = ?";
        List<CartItemDto> cartItems = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(CartItemDto.class), customerId);
        model.addAttribute("cartItems", cartItems);
        return "cart";
    }

    @PostMapping("/add")
    public String addToCart(@RequestParam("productId") int productId, @RequestParam("quantity") int quantity, HttpSession session) {
        Integer customerId = (Integer) session.getAttribute("customerId");
        if (customerId == null) {
            return "redirect:/login"; // 如果 session 中沒有 customerId，重定向到登入頁面
        }

        String sql = "INSERT INTO cart_items (customer_id, product_id, quantity) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE quantity = quantity + VALUES(quantity)";
        jdbcTemplate.update(sql, customerId, productId, quantity);
        return "redirect:/cart";
    }

    @PostMapping("/update")
    public String updateCart(@RequestParam("itemId") int itemId, @RequestParam("quantity") int quantity) {
        String sql = "UPDATE cart_items SET quantity = ? WHERE id = ?";
        jdbcTemplate.update(sql, quantity, itemId);
        return "redirect:/cart";
    }

    @PostMapping("/remove")
    public String removeFromCart(@RequestParam("itemId") int itemId) {
        String sql = "DELETE FROM cart_items WHERE id = ?";
        jdbcTemplate.update(sql, itemId);
        return "redirect:/cart";
    }

    @PostMapping("/checkout")
    public String checkout(HttpSession session) {
        Integer customerId = (Integer) session.getAttribute("customerId");
        if (customerId == null) {
            return "redirect:/login"; // 如果 session 中沒有 customerId，重定向到登入頁面
        }

        String sql = "SELECT ci.id, ci.product_id, ci.quantity, p.price FROM cart_items ci JOIN products p ON ci.product_id = p.id WHERE ci.customer_id = ?";
        List<CartItemDto> cartItems = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(CartItemDto.class), customerId);

        // 計算總價
        double totalPrice = cartItems.stream().mapToDouble(item -> item.getPrice() * item.getQuantity()).sum();

        // 創建訂單
        sql = "INSERT INTO orders (customer_id, total_price, created_at, updated_at) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, customerId, totalPrice, LocalDateTime.now(), LocalDateTime.now());

        // 獲取新創建的訂單ID
        sql = "SELECT LAST_INSERT_ID()";
        int orderId = jdbcTemplate.queryForObject(sql, Integer.class);

        // 將購物車中的商品轉換為訂單項目
        for (CartItemDto item : cartItems) {
            sql = "INSERT INTO order_items (order_id, product_id, quantity, price, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?)";
            jdbcTemplate.update(sql, orderId, item.getProductId(), item.getQuantity(), item.getPrice(), LocalDateTime.now(), LocalDateTime.now());
        }

        // 清空購物車
        sql = "DELETE FROM cart_items WHERE customer_id = ?";
        jdbcTemplate.update(sql, customerId);

        return "redirect:/orders";
    }
}
