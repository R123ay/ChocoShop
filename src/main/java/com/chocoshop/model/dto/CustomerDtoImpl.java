package com.chocoshop.model.dto;

import org.springframework.beans.factory.annotation.Autowired;

@Repository
public class CustomerDtoImpl {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Customer> findAll(){
		String sql = "SELECT * FROM customers;"
		return jdbcTemplate.query(sql, new BeanProper)
	}
}
