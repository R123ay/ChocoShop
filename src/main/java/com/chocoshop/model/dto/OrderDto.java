package com.chocoshop.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
public class OrderDto {
    private int orderId;
    private int customerId;
    private double totalPrice;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
