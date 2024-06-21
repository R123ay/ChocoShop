package com.chocoshop.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrderItemDto {
    private int orderItemId;
    private int orderId;
    private int productId;
    private String productName;
    private double price;
    private int quantity;
    private double totalPrice;
    private int customerId; // 用於 cart_items 表
}