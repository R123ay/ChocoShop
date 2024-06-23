package com.chocoshop.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderItemDto {
    private int orderItemId;
    private int orderId;
    private int productId;
    private int quantity;
    private double totalPrice;
}
