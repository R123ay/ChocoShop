package com.chocoshop.model.dto;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chocoshop.model.po.Order;

@Repository
public interface OrderDto {
    List<Order> findAll(); // 找到所有訂單
    Order findById(Integer id); // 根據ID找到訂單
    Integer add(Order order); // 新增訂單
    Integer deleteById(Integer id); // 根據ID刪除訂單
    Integer update(Order order);// 更新訂單
	void deleteOrderItemsByOrderId(Integer id);
}
