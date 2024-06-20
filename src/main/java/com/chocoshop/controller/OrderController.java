package com.chocoshop.controller;

import com.chocoshop.model.dto.OrderDto;
import com.chocoshop.model.dto.OrderItemDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping
    public String getAllOrders(HttpSession session, Model model) {
        Integer customerId = (Integer) session.getAttribute("customerId");
        if (customerId == null) {
            return "redirect:/login"; // 如果 session 中沒有 customerId，重定向到登入頁面
        }

        String sql = "SELECT * FROM orders WHERE customer_id = ?";
        List<OrderDto> orders = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(OrderDto.class), customerId);
        model.addAttribute("orders", orders);
        return "orders";
    }

    @GetMapping("/{id}")
    public String getOrderById(@PathVariable int id, Model model) {
        String sql = "SELECT * FROM orders WHERE id = ?";
        OrderDto order = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(OrderDto.class), id);

        sql = "SELECT oi.id, oi.product_id, p.name AS product_name, oi.quantity, oi.price " +
              "FROM order_items oi JOIN products p ON oi.product_id = p.id WHERE oi.order_id = ?";
        List<OrderItemDto> orderItems = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(OrderItemDto.class), id);

        order.setOrderItems(orderItems);
        model.addAttribute("order", order);
        return "orderDetail";
    }

    @GetMapping("/delete/{id}")
    public String deleteOrder(@PathVariable int id) {
        String sql = "DELETE FROM order_items WHERE order_id = ?";
        jdbcTemplate.update(sql, id);
        sql = "DELETE FROM orders WHERE id = ?";
        jdbcTemplate.update(sql, id);
        return "redirect:/orders";
    }
}
