package com.chocoshop.model.dto;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chocoshop.model.po.Customer;

@Repository
public interface CustomerDto {
    
    // Retrieve all customers
    public List<Customer> findAll();

    // Retrieve a customer by ID
    public Customer findById(Integer id);

    // Save a new customer
    public Integer add(Customer customer);

    // Delete a customer by ID
    public Integer deleteById(Integer id);

    // Update a customer
    public Integer update(Customer customer);
}
