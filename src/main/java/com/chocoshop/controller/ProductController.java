package com.chocoshop.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chocoshop.model.dto.ProductDto;

@Controller
@RequestMapping("/admin/products")
public class ProductController {

    private static final String UPLOADED_FOLDER = "src/main/resources/static/upload/";
    private static final Logger logger = Logger.getLogger(ProductController.class.getName());

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping
    public String getAllProducts(Model model) {
        String sql = "SELECT * FROM products";
        List<ProductDto> products = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ProductDto.class));
        model.addAttribute("products", products);
        return "product";
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
                // 檢查並創建目錄
                Path directory = Paths.get(UPLOADED_FOLDER);
                if (!Files.exists(directory)) {
                    Files.createDirectories(directory);
                }

                // 檢查是否存在同名文件，存在則刪除
                Path path = directory.resolve(file.getOriginalFilename());
                if (Files.exists(path)) {
                    Files.delete(path);
                }

                // 寫入文件
                byte[] bytes = file.getBytes();
                Files.write(path, bytes);
                product.setImageUrl("/static/upload/" + file.getOriginalFilename());
            } catch (IOException e) {
                logger.log(Level.SEVERE, "Failed to upload file", e);
                return "redirect:/admin/products?error=Failed to upload file";
            }
        }
        product.setCreatedAt(LocalDateTime.now());
        product.setUpdatedAt(LocalDateTime.now());
        String sql = "INSERT INTO products (name, category, price, image_url, description, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, product.getName(), product.getCategory(), product.getPrice(), product.getImageUrl(), product.getDescription(), product.getCreatedAt(), product.getUpdatedAt());
        return "redirect:/admin/products";
    }

    @PostMapping("/update")
    public String updateProduct(@Valid @ModelAttribute ProductDto product, BindingResult result, @RequestParam(value = "file", required = false) MultipartFile file) {
        if (result.hasErrors()) {
            return "redirect:/admin/products?error=Product name cannot be null or empty";
        }
        if (file != null && !file.isEmpty()) {
            try {
                // 檢查並創建目錄
                Path directory = Paths.get(UPLOADED_FOLDER);
                if (!Files.exists(directory)) {
                    Files.createDirectories(directory);
                }

                // 檢查是否存在同名文件，存在則刪除
                Path path = directory.resolve(file.getOriginalFilename());
                if (Files.exists(path)) {
                    Files.delete(path);
                }

                // 寫入文件
                byte[] bytes = file.getBytes();
                Files.write(path, bytes);
                product.setImageUrl("/static/upload/" + file.getOriginalFilename());
                Thread.sleep(500);  // 不建議使用，但保留原邏輯
            } catch (Exception e) {
                logger.log(Level.SEVERE, "Failed to upload file", e);
                return "redirect:/admin/products?error=Failed to upload file";
            }
        } else {
            String sql = "SELECT image_url FROM products WHERE product_id = ?";
            String imageUrl = jdbcTemplate.queryForObject(sql, new Object[]{product.getProductId()}, String.class);
            product.setImageUrl(imageUrl);
        }
        product.setUpdatedAt(LocalDateTime.now());
        String sql = "UPDATE products SET name = ?, category = ?, price = ?, image_url = ?, description = ?, updated_at = ? WHERE product_id = ?";
        jdbcTemplate.update(sql, product.getName(), product.getCategory(), product.getPrice(), product.getImageUrl(), product.getDescription(), product.getUpdatedAt(), product.getProductId());
        return "redirect:/admin/products";
    }

    @GetMapping("/delete/{productId}")
    public String deleteProduct(@PathVariable int productId) {
        // 檢查是否存在 order_items 表，這裡假設不存在
        // String sql = "DELETE FROM order_items WHERE product_id = ?";
        // jdbcTemplate.update(sql, productId);
        
        String sql = "DELETE FROM products WHERE product_id = ?";
        jdbcTemplate.update(sql, productId);
        return "redirect:/admin/products";
    }

    
    @GetMapping("/list")
    @ResponseBody
    public List<ProductDto> getProducts() {
        String sql = "SELECT * FROM products";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ProductDto.class));
    }
    @GetMapping("/product/{id}")
    @ResponseBody
    public ProductDto getProduct(@PathVariable int id) {
        String sql = "SELECT * FROM products WHERE product_id = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(ProductDto.class), id);
    }


}
