package com.chocoshop.model.dto;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.chocoshop.model.po.Customer;

@Repository
public interface CustomerDto {
    
    // 獲取所有客戶的方法
    public List<Customer> findAll(); 
    
    // 根據ID獲取特定客戶的方法
    public Customer findById(Integer id); 
    
    // 新增客戶的方法
    public Integer add(Customer customer); 
    
    // 刪除客戶的方法
    public Integer deleteById(Integer id); 
    
    // 更新客戶的方法
    public Integer update(Customer customer); 
}
