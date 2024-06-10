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

    public Integer saveCustomer(Customer customer) {
        return customerDto.add(customer);
    }

    public Integer deleteCustomer(Integer id) {
        return customerDto.deleteById(id);
    }

    public Integer updateCustomer(Customer customer) {
        return customerDto.update(customer);
    }
}
