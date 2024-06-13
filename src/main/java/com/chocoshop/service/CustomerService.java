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

    public List<Customer> getAllCustomers() {
        return customerDto.findAll();
    }

    public Customer getCustomerById(Integer id) {
        return customerDto.findById(id);
    }

    public Integer addCustomer(Customer customer) {
        return customerDto.add(customer);
    }

    // Revised edit function to match the DTO
    public Customer editCustomer(Integer id, Customer customer) {
        return customerDto.edit(id, customer);
    }
    
    public Integer deleteCustomer(Integer id) {
        return customerDto.deleteById(id);
    }
}
