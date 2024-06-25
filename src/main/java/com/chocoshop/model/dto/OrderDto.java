package com.chocoshop.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDto {
    private int orderId;
    private String name;
    private String phone;
    private String email;
    private String paymentMethod;
    private String deliveryDate;
    private String purchaseDate;
    private double totalPrice;
    private String status;  // 新增的屬性
}
