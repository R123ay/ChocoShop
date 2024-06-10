package com.chocoshop.model.dto;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chocoshop.model.po.Customer;

@Repository
public class CustomerDtoImpl implements CustomerDto {
    
    @Autowired
    JdbcTemplate jdbcTemplate;
    
    @Override
    public List<Customer> findAll() {
        String sql = "SELECT * FROM customers";
        List<Customer> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Customer.class));
        return list;
    }

    @Override
    public Customer findById(Integer id) {
        String sql = "SELECT * FROM customers WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<>(Customer.class));
    }

    @Override
    public Integer add(Customer customer) {
        String sql = "INSERT INTO customers (name, email, phone) VALUES (?, ?, ?)";
        return jdbcTemplate.update(sql, customer.getName(), customer.getEmail(), customer.getPhone());
    }

    @Override
    public Integer update(Customer customer) {
        String sql = "UPDATE customers SET name = ?, email = ?, phone = ? WHERE id = ?";
        return jdbcTemplate.update(sql, customer.getName(), customer.getEmail(), customer.getPhone(), customer.getId());
    }

    @Override
    public Integer deleteById(Integer id) {
        String sql = "DELETE FROM customers WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }
}
