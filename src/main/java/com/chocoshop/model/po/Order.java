package com.chocoshop.model.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    private Integer id;
    private Integer customerId;
    private Double totalPrice;
    private String status;
    private Date createdAt;
    private Date updatedAt;
}
