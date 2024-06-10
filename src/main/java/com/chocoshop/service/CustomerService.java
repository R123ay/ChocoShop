package com.chocoshop.service; // 這行是定義這個檔案的包名

import java.util.List; // 引入 Java 的 List 類別

import org.springframework.beans.factory.annotation.Autowired; // 引入 Spring 的自動注入註解
import org.springframework.stereotype.Service; // 引入 Spring 的服務註解

import com.chocoshop.model.dto.CustomerDto; // 引入 CustomerDto 類別
import com.chocoshop.model.po.Customer; // 引入 Customer 類別

@Service // 註解表示這個類別是一個服務層的 Bean
public class CustomerService { // 定義 CustomerService 類別

    @Autowired // 自動注入 CustomerDto 類別
    private CustomerDto customerDto; // 定義一個 CustomerDto 類別的私有成員變數

    public List<Customer> getAllCustomers() { // 定義一個方法，返回所有客戶的列表
        return customerDto.findAll(); // 調用 customerDto 的 findAll 方法來獲取所有客戶
    }

    public Customer getCustomerById(Integer id) { // 定義一個方法，根據客戶 ID 返回客戶
        return customerDto.findById(id); // 調用 customerDto 的 findById 方法來獲取特定客戶
    }

    public Integer saveCustomer(Customer customer) { // 定義一個方法，保存或更新客戶資料
        if (customer.getId() != null && customerDto.findById(customer.getId()) != null) { // 如果客戶的 ID 不為空且已存在
            return customerDto.update(customer); // 調用 customerDto 的 update 方法來更新客戶資料
        } else {
            return customerDto.add(customer); // 否則，調用 customerDto 的 add 方法來新增客戶資料
        }
    }

    public Integer deleteCustomer(Integer id) { // 定義一個方法，根據客戶 ID 刪除客戶
        return customerDto.deleteById(id); // 調用 customerDto 的 deleteById 方法來刪除特定客戶
    }
}
