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
        // 查詢所有客戶
        String sql = "SELECT * FROM customers";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Customer.class));
    }

    @Override
    public Customer findById(Integer id) {
        // 根據ID查詢客戶
        String sql = "SELECT * FROM customers WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<>(Customer.class));
    }

    @Override
    public void save(Customer customer) {
        // 保存新客戶
        String sql = "INSERT INTO customers (name, email) VALUES (?, ?)";
        jdbcTemplate.update(sql, customer.getName(), customer.getEmail());
    }

    @Override
    public Integer edit(Customer customer) {
        // 更新客戶信息
        String sql = "UPDATE customers SET name = ?, email = ? WHERE id = ?";
        return jdbcTemplate.update(sql, customer.getName(), customer.getEmail(), customer.getId());
    }

    @Override
    public void delete(Integer id) {
        // 刪除客戶
        String sql = "DELETE FROM customers WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

	@Override
	public Integer add(Customer customer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer deleteById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer update(Customer customer) {
		// TODO Auto-generated method stub
		return null;
	}
}
