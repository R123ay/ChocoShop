package com.chocoshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chocoshop.model.dto.CustomerDto;
import com.chocoshop.model.po.Customer;

@Service
public class CustomerService {

    @Autowired
    private CustomerDto customerDto;

    // Retrieve all customers
    public List<Customer> getAllCustomers() {
        return customerDto.findAll();
    }

    // Retrieve a customer by ID
    public Customer getCustomerById(Integer id) {
        return customerDto.findById(id);
    }

    // Add a new customer
    public Integer saveCustomer(Customer customer) {
        return customerDto.add(customer);
    }

    // Update an existing customer
    public Integer updateCustomer(Customer customer) {
        return customerDto.update(customer);
    }

    // Delete a customer by ID
    public Integer deleteCustomer(Integer id) {
        return customerDto.deleteById(id);
    }
}
