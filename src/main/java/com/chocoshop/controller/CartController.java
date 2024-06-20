package com.chocoshop.controller;

import com.chocoshop.model.dto.CartItemDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;
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
}
