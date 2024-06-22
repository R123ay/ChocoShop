package com.chocoshop.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartItemDto {
    private int cartId;
    private int customerId;
    private int productId;
    private double price;
    private int quantity;
    private double totalPrice;
}
