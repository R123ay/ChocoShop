package com.chocoshop.model.dto;

import lombok.Data;

@Data
public class CartItemDto {
    private int id;
    private String name;
    private double price;
    private int quantity;
}
