package com.chocoshop.model.dto;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chocoshop.model.po.Order;

@Repository
public class OrderDtoImpl implements OrderDto {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public List<Order> findAll() {
        String sql = "SELECT * FROM orders";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Order.class));
    }

    @Override
    public Order findById(Integer id) {
        String sql = "SELECT * FROM orders WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<>(Order.class));
    }

    @Override
    public Integer add(Order order) {
        String sql = "INSERT INTO orders (customer_id, total_price, status) VALUES (?, ?, ?)";
        return jdbcTemplate.update(sql, order.getCustomerId(), order.getTotalPrice(), order.getStatus());
    }

    @Override
    public Integer deleteById(Integer id) {
        String sql = "DELETE FROM orders WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }
}
