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

    public List<Order> getAllOrders() {
        return orderDto.findAll();
    }

    public Order getOrderById(Integer id) {
        return orderDto.findById(id);
    }

    public Integer saveOrder(Order order) {
        return orderDto.add(order);
    }

    public Integer deleteOrder(Integer id) {
        // 首先刪除與該訂單相關的 order_items
        orderDto.deleteOrderItemsByOrderId(id);
        // 然後刪除訂單
        return orderDto.deleteById(id);
    }
}
