package com.chocoshop.model.dto;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.chocoshop.model.po.Customer;

@Repository
public interface CustomerDto {
    
    // Retrieve all customers
    List<Customer> findAll(); // To get all customers
    
    // Retrieve a customer by their ID
    Customer findById(Integer id); // To get a customer by their ID
    
    // Add a new customer
    Integer add(Customer customer); // To add a new customer
    
    // Delete a customer by their ID
    Integer deleteById(Integer id); // To delete a customer by their ID
    
    // Update customer information
    Integer update(Customer customer); // To update customer information
    
    // Edit customer information
    Customer edit(Integer id, Customer customer); // To edit customer information
}
