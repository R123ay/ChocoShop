package com.chocoshop.model.dto;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chocoshop.model.po.Product;

@Repository
public interface HomeDto {
	List<Product> findAll(); // 取得產品編號
	Product findById(Integer id); // 取得產品名稱
	Integer add(Product product); // 取得產品價格
	Integer deleteById(Integer id); // 刪除一個產品
}
