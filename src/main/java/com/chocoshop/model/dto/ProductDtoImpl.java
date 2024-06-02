package com.chocoshop.model.dto;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chocoshop.model.po.Product;

@Repository
public class ProductDtoImpl implements ProductDto {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Product> findAll() {
		String sql = "";
		List<Product> list = (List<Product>) jdbcTemplate.queryForObject(sql, Product.class);
		return list;
	}

	@Override
	public Product findById(Integer id) {
		String sql = "";
		//jdbcTemplate.q
		return null;
	}

	@Override
	public Integer add(Product product) {
		String sql = "";
		//jdbcTemplate.q
		return null;
	}

	@Override
	public Integer deleteById(Integer id) {
		String sql = "";
		//jdbcTemplate.q
		return null;
	}
}
