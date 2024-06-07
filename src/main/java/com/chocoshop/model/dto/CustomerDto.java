package com.chocoshop.model.dto;

import java.util.List;

import com.chocoshop.model.po.Customer;

public interface CustomerDto {
    List<Customer> findAll();
    Customer findById(Integer id);
    Integer add(Customer customer);
    Integer deleteById(Integer id);
    Integer update(Customer customer);
}
