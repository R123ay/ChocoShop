package com.chocoshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.chocoshop.model.po.Product;
import com.chocoshop.service.ProductService;

@Controller
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping
    public String getAllProducts(Model model) {
        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products);
        return "product"; // 連結到 product.jsp
    }

    @PostMapping("/add")
    public String addProduct(@RequestParam String name, @RequestParam String description, @RequestParam double price) {
        Product product = new Product();
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        productService.saveProduct(product);
        return "redirect:/products"; // 添加後重定向到產品列表頁面
    }

    @PostMapping("/delete")
    public String deleteProduct(@RequestParam Integer id) {
        productService.deleteProduct(id);
        return "redirect:/products"; // 刪除後重定向到產品列表頁面
    }

    @PostMapping("/update")
    public String updateProduct(@RequestParam Integer id, @RequestParam String name, @RequestParam String description, @RequestParam double price) {
        Product product = productService.getProductById(id);
        if (product != null) {
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            productService.saveProduct(product);
        }
        return "redirect:/products"; // 更新後重定向到產品列表頁面
    }
}
