package com.chocoshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chocoshop.model.dto.ProductDto;
import com.chocoshop.model.po.Product;



@Service
public class ProductService {
    @Autowired
    private ProductDto productDto;

    public List<Product> getAllProducts() {
    	productDto.findAll().forEach(System.out::println);
        return productDto.findAll();
    }

    public Product getProductById(Integer id) {
    	
        return productDto.findById(id);
    }

    public Integer saveProduct(Product product) {
    	
        return productDto.add(product);
    }

    public Integer deleteProduct(Integer id) {
    	
    	return productDto.deleteById(id);
    }
}
