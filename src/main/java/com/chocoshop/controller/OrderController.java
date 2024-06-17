package com.chocoshop.controller;

import com.chocoshop.model.po.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping
    public String getAllOrders(Model model) {
        String sql = "SELECT * FROM orders";
        List<Order> orders = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Order.class));
        model.addAttribute("orders", orders);
        return "order";
    }

    @PostMapping("/add")
    public String addOrder(@ModelAttribute Order order) {
        String sql = "INSERT INTO orders (/*columns*/) VALUES (/*values*/)";
        jdbcTemplate.update(sql /*parameters*/);
        return "redirect:/orders";
    }

    @PostMapping("/update/{id}")
    public String updateOrder(@PathVariable int id, @ModelAttribute Order order) {
        String sql = "UPDATE orders SET /*columns*/ = ? WHERE id = ?";
        jdbcTemplate.update(sql, /*parameters*/ order.getId());
        return "redirect:/orders";
    }

    @GetMapping("/delete/{id}")
    public String deleteOrder(@PathVariable int id) {
        String sql = "DELETE FROM orders WHERE id = ?";
        jdbcTemplate.update(sql, id);
        return "redirect:/orders";
    }
}
