package com.chocoshop.model.dto;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chocoshop.model.po.Product;

@Repository
public interface ProductDto {
	
	public List<Product> findAll(); // 取得產品編號
	
	public Product findById(Integer id); // 取得產品名稱
	
	public Integer add(Product product); // 取得產品價格
	
	public Integer deleteById(Integer id); // 刪除一個產品
}
