package com.chocoshop.model.dto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.chocoshop.model.po.Customer;

@Repository
public class CustomerDtoImpl implements CustomerDto {
    
    @Autowired
    JdbcTemplate jdbcTemplate;

    // RowMapper for Customer
    private static final class CustomerRowMapper implements RowMapper<Customer> {
        @Override
        public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
            Customer customer = new Customer();
            customer.setId(rs.getInt("id"));
            customer.setName(rs.getString("name"));
            customer.setEmail(rs.getString("email"));
            customer.setPhone(rs.getString("phone"));
            return customer;
        }
    }

    @Override
    public List<Customer> findAll() {
        String sql = "SELECT * FROM customers";
        return jdbcTemplate.query(sql, new CustomerRowMapper());
    }

    @Override
    public Customer findById(Integer id) {
        String sql = "SELECT * FROM customers WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new CustomerRowMapper());
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
    public Integer update(Customer customer) {
        String sql = "UPDATE customers SET name = ?, email = ?, phone = ? WHERE id = ?";
        return jdbcTemplate.update(sql, customer.getName(), customer.getEmail(), customer.getPhone(), customer.getId());
    }
}
