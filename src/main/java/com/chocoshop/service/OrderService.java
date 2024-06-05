package com.chocoshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chocoshop.model.dto.OrderDto;
import com.chocoshop.model.po.Order;

@Service
public class OrderService {
    @Autowired
    private OrderDto orderDto;

    public Integer saveOrder(Order order) {
        return orderDto.add(order);
    }

    public List<Order> getAllOrders() {
        return orderDto.findAll();
    }

    public Order getOrderById(Integer id) {
        return orderDto.findById(id);
    }

    public Integer deleteOrder(Integer id) {
        return orderDto.deleteById(id);
    }
}
