package com.chocoshop.controller;

import com.chocoshop.model.dto.ProductDto;
import com.chocoshop.model.dto.ProductDtoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/products")
public class ProductController {

    private static String UPLOADED_FOLDER = "E:/GitHub/ChocoShop/src/main/resources/static/upload/";

    @Autowired
    private ProductDtoImpl productDtoImpl;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping
    public String getAllProducts(Model model) {
        List<ProductDto> products = productDtoImpl.getAllProducts();
        model.addAttribute("products", products);
        return "product";
    }

    @PostMapping("/add")
    public String addProduct(@ModelAttribute ProductDto product, @RequestParam("file") MultipartFile file) {
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
                Files.write(path, bytes);
                product.setImageUrl("/static/upload/" + file.getOriginalFilename());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        product.setCreatedAt(LocalDateTime.now());
        product.setUpdatedAt(LocalDateTime.now());
        productDtoImpl.addProduct(product);
        return "redirect:/products";
    }

    @PostMapping("/update/{id}")
    public String updateProduct(@PathVariable int id, @ModelAttribute ProductDto product, @RequestParam(value = "file", required = false) MultipartFile file) {
        if (product.getName() == null || product.getName().isEmpty()) {
            return "redirect:/products?error=Product name cannot be null or empty";
        }
        System.out.println(file.getOriginalFilename());
        if (file != null && !file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
                Files.write(path, bytes);
                product.setImageUrl("/static/upload/" + file.getOriginalFilename());
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            ProductDto existingProduct = productDtoImpl.getProductById(id);
            product.setImageUrl(existingProduct.getImageUrl());
        }
        product.setId(id);
        product.setUpdatedAt(LocalDateTime.now());
        productDtoImpl.updateProduct(product);
        return "redirect:/products";
    }

    @GetMapping("/delete/{id}")
    public String deleteProduct(@PathVariable int id) {
        String sql = "DELETE FROM order_items WHERE product_id = ?";
        jdbcTemplate.update(sql, id);
        productDtoImpl.deleteProduct(id);
        return "redirect:/products";
    }
}
