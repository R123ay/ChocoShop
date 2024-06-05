package com.chocoshop.model.dto;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chocoshop.model.po.Order;

@Repository
public interface OrderDto {
    public Integer add(Order order);
    public List<Order> findAll();
    public Order findById(Integer id);
    public Integer deleteById(Integer id);
}

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
    public Integer add(Order order) {
        // 實現插入訂單的 SQL 操作
        // 你需要適當修改此方法來適應你的資料庫架構
        return 1;
    }

    @Override
    public List<Order> findAll() {
        String sql = "SELECT * FROM orders";
        List<Order> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Order.class));
        return list;
    }

    @Override
    public Order findById(Integer id) {
        String sql = "SELECT * FROM orders WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<>(Order.class));
    }

    @Override
    public Integer deleteById(Integer id) {
        String sql = "DELETE FROM orders WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }
}
