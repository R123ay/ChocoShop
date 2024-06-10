package com.chocoshop.model.dto;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chocoshop.model.po.Product;

@Repository
public class HomeDtoImpl implements HomeDto {
	
    @Autowired
    JdbcTemplate jdbcTemplate;
	
    @Override
    public List<Product> findAll() {
        String sql = "SELECT * FROM products"; // 需要使用實際的表名
        List<Product> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Product.class));
        return list;
    }

    @Override
    public Product findById(Integer id) {
        String sql = "SELECT * FROM products WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<>(Product.class));
    }

    @Override
    public Integer add(Product product) {
        String sql = "INSERT INTO products (name, description, price) VALUES (?, ?, ?)";
        return jdbcTemplate.update(sql, product.getName(), product.getDescription(), product.getPrice());
    }

    @Override
    public Integer deleteById(Integer id) {
        String sql = "DELETE FROM products WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }
}
