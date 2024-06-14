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
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Customer> findAll() {
        String sql = "SELECT * FROM customers";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Customer.class));
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
    public Integer deleteById(Integer id) {
        String sql = "DELETE FROM customers WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }

    @Override
    public Customer edit(Integer id, Customer customer) {
        String sql = "UPDATE customers SET name = ?, email = ?, phone = ? WHERE id = ?";
        jdbcTemplate.update(sql, customer.getName(), customer.getEmail(), customer.getPhone(), id);
        return findById(id);
    }

	@Override
	public Integer update(Customer customer) {
		// TODO Auto-generated method stub
		return null;
	}
}
