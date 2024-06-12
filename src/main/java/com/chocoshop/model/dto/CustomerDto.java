package com.chocoshop.model.dto;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chocoshop.model.po.Customer;

@Repository
public interface CustomerDto {
    
    // 取得所有客戶信息
    public List<Customer> findAll();

    // 根據ID取得特定客戶信息
    public Customer findById(Integer id);

    // 新增客戶
    public Integer add(Customer customer);

    // 刪除客戶
    public Integer deleteById(Integer id);

    // 編輯客戶信息
    public Integer edit(Customer customer);
    
    public Integer update(Customer customer);

	void save(Customer customer);

	void delete(Integer id);
}
