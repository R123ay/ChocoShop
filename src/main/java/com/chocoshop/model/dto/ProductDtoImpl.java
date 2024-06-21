package com.chocoshop.model.dto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDtoImpl {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<ProductDto> getAllProducts() {
        String sql = "SELECT * FROM products";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ProductDto.class));
    }

    public ProductDto getProductById(int productId) {
        String sql = "SELECT * FROM products WHERE product_id = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(ProductDto.class), productId);
    }

    public void addProduct(ProductDto product) {
        String sql = "INSERT INTO products (name, category, price, image_url, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, product.getName(), product.getCategory(), product.getPrice(), product.getImageUrl(), product.getCreatedAt(), product.getUpdatedAt());
    }

    public void updateProduct(ProductDto product) {
        String sql = "UPDATE products SET name = ?, category = ?, price = ?, image_url = ?, updated_at = ? WHERE product_id = ?";
        jdbcTemplate.update(sql, product.getName(), product.getCategory(), product.getPrice(), product.getImageUrl(), product.getUpdatedAt(), product.getProductId());
    }

    public void deleteProduct(int productId) {
        String sql = "DELETE FROM products WHERE product_id = ?";
        jdbcTemplate.update(sql, productId);
    }
}
