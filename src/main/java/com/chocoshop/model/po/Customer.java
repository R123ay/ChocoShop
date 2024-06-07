package com.chocoshop.model.po;

import java.sql.Timestamp;

public class Customer {
    private Integer id;  // 客戶的唯一標識號
    private String name; // 客戶的名字
    private String email; // 客戶的電子郵件地址
    private String phone; // 客戶的電話號碼
    private String address; // 客戶的住址
    private Timestamp createdAt; // 資料創建的時間

    // 獲取 id 的方法
    public Integer getId() {
        return id;
    }

    // 設置 id 的方法
    public void setId(Integer id) {
        this.id = id;
    }

    // 獲取 name 的方法
    public String getName() {
        return name;
    }

    // 設置 name 的方法
    public void setName(String name) {
        this.name = name;
    }

    // 獲取 email 的方法
    public String getEmail() {
        return email;
    }

    // 設置 email 的方法
    public void setEmail(String email) {
        this.email = email;
    }

    // 獲取 phone 的方法
    public String getPhone() {
        return phone;
    }

    // 設置 phone 的方法
    public void setPhone(String phone) {
        this.phone = phone;
    }

    // 獲取 address 的方法
    public String getAddress() {
        return address;
    }

    // 設置 address 的方法
    public void setAddress(String address) {
        this.address = address;
    }

    // 獲取 createdAt 的方法
    public Timestamp getCreatedAt() {
        return createdAt;
    }

    // 設置 createdAt 的方法
    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
