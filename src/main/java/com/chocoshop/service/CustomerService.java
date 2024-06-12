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

    public void saveCustomer(Customer customer) {
        customerDto.save(customer);
    }

    // 更新客戶信息
    public void updateCustomer(Customer customer) {
        customerDto.update(customer);
    }

    public void deleteCustomer(Integer id) {
        customerDto.delete(id);
    }
}
