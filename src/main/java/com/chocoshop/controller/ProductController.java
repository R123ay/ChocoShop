
package com.chocoshop.controller;

import com.chocoshop.model.dto.ProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
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
    private JdbcTemplate jdbcTemplate;

    @GetMapping
    public String getAllProducts(Model model) {
        String sql = "SELECT * FROM products";
        List<ProductDto> products = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ProductDto.class));
        model.addAttribute("products", products);
        return "product";
    }

    @GetMapping("/{productId}")
    public String getProductById(@PathVariable int productId, Model model) {
        String sql = "SELECT * FROM products WHERE product_id = ?";
        ProductDto product = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(ProductDto.class), productId);
        model.addAttribute("product", product);
        return "productDetail";
    }

    @GetMapping("/search")
    public String searchProducts(@RequestParam("keyword") String keyword, Model model) {
        String sql = "SELECT * FROM products WHERE name LIKE ? OR category LIKE ?";
        List<ProductDto> products = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ProductDto.class), "%" + keyword + "%", "%" + keyword + "%");
        model.addAttribute("products", products);
        return "product";
    }

    @PostMapping("/add")
    public String addProduct(@Valid @ModelAttribute ProductDto product, BindingResult result, @RequestParam("file") MultipartFile file) {
        if (result.hasErrors()) {
            return "product";
        }
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
        String sql = "INSERT INTO products (name, category, price, image_url, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, product.getName(), product.getCategory(), product.getPrice(), product.getImageUrl(), product.getCreatedAt(), product.getUpdatedAt());
        return "redirect:/products";
    }

    @PostMapping("/update")
    public String updateProduct(@Valid @ModelAttribute ProductDto product, BindingResult result, @RequestParam(value = "file", required = false) MultipartFile file) {
        if (result.hasErrors()) {
            return "redirect:/products?error=Product name cannot be null or empty";
        }
        if (file != null && !file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
                Files.write(path, bytes);
                product.setImageUrl("/static/upload/" + file.getOriginalFilename());
                Thread.sleep(500);;
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            String sql = "SELECT image_url FROM products WHERE product_id = ?";
            String imageUrl = jdbcTemplate.queryForObject(sql, new Object[]{product.getProductId()}, String.class);
            product.setImageUrl(imageUrl);
        }
        product.setUpdatedAt(LocalDateTime.now());
        String sql = "UPDATE products SET name = ?, category = ?, price = ?, image_url = ?, updated_at = ? WHERE product_id = ?";
        jdbcTemplate.update(sql, product.getName(), product.getCategory(), product.getPrice(), product.getImageUrl(), product.getUpdatedAt(), product.getProductId());
        return "redirect:/products";
    }

    @GetMapping("/delete/{productId}")
    public String deleteProduct(@PathVariable int productId) {
        String sql = "DELETE FROM order_items WHERE product_id = ?";
        jdbcTemplate.update(sql, productId);
        sql = "DELETE FROM products WHERE product_id = ?";
        jdbcTemplate.update(sql, productId);
        return "redirect:/products";
    }
}
