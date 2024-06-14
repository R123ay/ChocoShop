package com.chocoshop.model.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderItem {
    private Integer id;
    private Integer orderId;
    private Integer productId;
    private Integer quantity;
    private Double price;
}
