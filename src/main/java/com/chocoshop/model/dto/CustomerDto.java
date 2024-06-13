package com.chocoshop.model.dto;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chocoshop.model.po.Customer;

@Repository
public interface CustomerDto {
    
    // Retrieve all customers
    List<Customer> findAll();

    // Retrieve a customer by their ID
    Customer findById(Integer id);

    // Add a new customer
    Integer add(Customer customer);

    // Delete a customer by their ID
    Integer deleteById(Integer id);

    // Edit customer information
    Customer edit(Integer id, Customer customer);
}
