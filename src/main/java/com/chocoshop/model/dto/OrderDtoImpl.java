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
    private JdbcTemplate jdbcTemplate;

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
        String sql = "INSERT INTO orders (customer_id, total_price, status, created_at, updated_at) VALUES (?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql, order.getCustomerId(), order.getTotalPrice(), order.getStatus(), order.getCreatedAt(), order.getUpdatedAt());
    }

    @Override
    public Integer deleteById(Integer id) {
        // 刪除之前先刪除相關的 order_items
        String deleteOrderItemsSql = "DELETE FROM order_items WHERE order_id = ?";
        jdbcTemplate.update(deleteOrderItemsSql, id);

        String sql = "DELETE FROM orders WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }

    @Override
    public Integer update(Order order) {
        String sql = "UPDATE orders SET customer_id = ?, total_price = ?, status = ?, updated_at = ? WHERE id = ?";
        return jdbcTemplate.update(sql, order.getCustomerId(), order.getTotalPrice(), order.getStatus(), order.getUpdatedAt(), order.getId());
    }

	@Override
	public void deleteOrderItemsByOrderId(Integer id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setOrderItems(List<OrderItemDto> orderItems) {
		// TODO Auto-generated method stub
		
	}
}
