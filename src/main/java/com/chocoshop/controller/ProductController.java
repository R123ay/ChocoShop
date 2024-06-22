package com.chocoshop.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chocoshop.model.dto.CartItemDto;
import com.chocoshop.model.dto.ProductDto;

@Controller
@RequestMapping("/products")
public class ProductController {

    private static final String UPLOADED_FOLDER = "D:/Java Workspace/ChocoShop/src/main/resources/static/upload/";
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
                return "redirect:/products?error=Failed to upload file";
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
                return "redirect:/products?error=Failed to upload file";
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
    
    @GetMapping("/list")
    @ResponseBody
    public List<ProductDto> getProducts() {
        String sql = "SELECT * FROM products";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ProductDto.class));
    }

    @PostMapping("/cart/add")
    @ResponseBody
    public String addToCart(@RequestBody CartItemDto cartItem) {
        cartItem.setTotalPrice(cartItem.getPrice() * cartItem.getQuantity());
        
        String sql = "INSERT INTO cart_items (customer_id, product_id, price, quantity, total_price) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, cartItem.getCustomerId(), cartItem.getProductId(), cartItem.getPrice(), cartItem.getQuantity(), cartItem.getTotalPrice());
        return "{\"success\": true}";
    }

    @PostMapping("/cart/remove")
    @ResponseBody
    public String removeFromCart(@RequestBody CartItemDto cartItem) {
        String sql = "DELETE FROM cart_items WHERE customer_id = ? AND product_id = ?";
        jdbcTemplate.update(sql, cartItem.getCustomerId(), cartItem.getProductId());
        return "{\"success\": true}";
    }

    @PostMapping("/cart/checkout")
    @ResponseBody
    public String checkout(@RequestBody Map<String, Integer> request) {
        int customerId = request.get("customerId");
        double totalAmount = 0;

        // 查詢購物車項目
        String sql = "SELECT * FROM cart_items WHERE customer_id = ?";
        List<CartItemDto> cartItems = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(CartItemDto.class), customerId);

        // 生成訂單
        sql = "INSERT INTO orders (customer_id, total_price) VALUES (?, ?)";
        jdbcTemplate.update(sql, customerId, totalAmount);

        // 取得訂單ID
        int orderId = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);

        // 插入訂單項目並計算總金額
        for (CartItemDto item : cartItems) {
            totalAmount += item.getTotalPrice();
            sql = "INSERT INTO order_items (order_id, product_id, quantity, total_price) VALUES (?, ?, ?, ?)";
            jdbcTemplate.update(sql, orderId, item.getProductId(), item.getQuantity(), item.getTotalPrice());
        }

        // 更新訂單總價
        sql = "UPDATE orders SET total_price = ? WHERE order_id = ?";
        jdbcTemplate.update(sql, totalAmount, orderId);

        // 清空購物車
        sql = "DELETE FROM cart_items WHERE customer_id = ?";
        jdbcTemplate.update(sql, customerId);

        return "{\"success\": true}";
    }
}
