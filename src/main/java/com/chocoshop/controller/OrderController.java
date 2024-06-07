package com.chocoshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.chocoshop.model.po.Order;
import com.chocoshop.service.OrderService;

@Controller
@RequestMapping("/orders")
public class OrderController {
    
    @Autowired
    private OrderService orderService;
    
    @PostMapping
    public String createOrder(@ModelAttribute Order order) {
        orderService.saveOrder(order);
        return "redirect:/orders";
    }

    @GetMapping
    public String getAllOrders(Model model) {
        List<Order> orders = orderService.getAllOrders();
        model.addAttribute("orders", orders);
        return "order";
    }

    @GetMapping("/{id}")
    public String getOrderById(@PathVariable Integer id, Model model) {
        Order order = orderService.getOrderById(id);
        model.addAttribute("order", order);
        return "orderDetail"; // Assuming you have an orderDetail.jsp to display single order details
    }

    @PostMapping("/delete")
    public String deleteOrder(@RequestParam Integer id) {
        orderService.deleteOrder(id);
        return "redirect:/orders";
    }
}