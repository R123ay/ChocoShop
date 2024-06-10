package com.chocoshop.model.dto;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.chocoshop.model.po.Product;

@Repository
public interface ProductDto {
    // 取得所有產品
    List<Product> findAll();
    
    // 根據ID取得產品
    Product findById(Integer id);
    
    // 添加新產品
    Integer add(Product product);
    
    // 更新產品資料
    Integer update(Product product);
    
    // 根據ID刪除產品
    Integer deleteById(Integer id);
}
