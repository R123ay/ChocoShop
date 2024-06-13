package com.chocoshop.model.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // Generates getters, setters, toString, equals, and hashCode methods
@NoArgsConstructor // Generates a no-argument constructor
@AllArgsConstructor // Generates an all-argument constructor
public class Customer {
    private Integer id; // Customer's unique identifier
    private String name; // Customer's name
    private String email; // Customer's email
    private String phone; // Customer's phone number
}
