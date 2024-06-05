package com.chocoshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model; // 用於將數據傳遞給視圖層
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chocoshop.model.po.Product;
import com.chocoshop.service.ProductService;

@Controller
@RequestMapping("/api/products") // 基礎路徑 /api/products
public class ProductController {

    @Autowired
    private ProductService productService; // 自動注入 ProductService 服務

    @GetMapping("/index")
    public String getIndex(Model model) {
        return "index"; // 返回 index.jsp 視圖
    }

    @GetMapping
    public List<Product> getAllProducts() {
        return productService.getAllProducts(); // 返回所有產品
    }

    @GetMapping("/{id}")
    public Product getProductById(@PathVariable Integer id) {
        return productService.getProductById(id); // 根據 id 獲取產品
    }

    @PostMapping
    public Integer createProduct(@RequestBody Product product) {
        return productService.saveProduct(product); // 創建新產品
    }

    @DeleteMapping("/{id}")
    public Integer deleteProduct(@PathVariable Integer id) {
        return productService.deleteProduct(id); // 根據 id 刪除產品
    }
}
