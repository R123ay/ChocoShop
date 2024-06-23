package com.chocoshop.controller;

import com.chocoshop.model.dto.OrderDto;
import com.chocoshop.model.dto.OrderItemDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping
    public String adminHome(Model model) {
        return "admin";
    }

    @GetMapping("/orders")
    public String viewOrders(Model model) {
        String sql = "SELECT * FROM orders";
        List<OrderDto> orders = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(OrderDto.class));
        model.addAttribute("orders", orders);
        return "orders";
    }

    @GetMapping("/orders/{orderId}")
    public String viewOrderDetails(@PathVariable int orderId, Model model) {
        String sql = "SELECT * FROM order_items WHERE order_id = ?";
        List<OrderItemDto> orderItems = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(OrderItemDto.class), orderId);
        model.addAttribute("orderItems", orderItems);

        sql = "SELECT * FROM orders WHERE order_id = ?";
        OrderDto order = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(OrderDto.class), orderId);
        model.addAttribute("order", order);

        return "orderDetails";
    }
}
