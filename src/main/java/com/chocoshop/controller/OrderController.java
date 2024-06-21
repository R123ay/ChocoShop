package com.chocoshop.controller;

import com.chocoshop.model.dto.OrderDto;
import com.chocoshop.model.dto.OrderItemDto;
import com.chocoshop.model.dto.ProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping
    public String getAllOrders(Model model) {
        String sql = "SELECT * FROM orders";
        List<OrderDto> orders = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(OrderDto.class));
        model.addAttribute("orders", orders);
        return "order"; // 返回 orders.jsp 視圖
    }

    @GetMapping("/{id}")
    public String getOrderById(@PathVariable int id, Model model) {
        String sql = "SELECT * FROM orders WHERE order_id = ?";
        OrderDto order = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(OrderDto.class), id);
        model.addAttribute("order", order);

        String itemSql = "SELECT * FROM order_items WHERE order_id = ?";
        List<OrderItemDto> orderItems = jdbcTemplate.query(itemSql, new BeanPropertyRowMapper<>(OrderItemDto.class), id);
        model.addAttribute("orderItems", orderItems);

        return "orderDetail"; // 返回 orderDetail.jsp 視圖
    }

    @PostMapping("/add")
    public String addOrder(@Valid @ModelAttribute OrderDto order, @RequestParam("items") List<OrderItemDto> items) {
        String sql = "INSERT INTO orders (customer_id, total_price) VALUES (?, ?)";
        jdbcTemplate.update(sql, order.getCustomerId(), order.getTotalPrice());

        int orderId = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);

        for (OrderItemDto item : items) {
            String itemSql = "INSERT INTO order_items (order_id, product_id, product_name, price, quantity) VALUES (?, ?, ?, ?, ?)";
            jdbcTemplate.update(itemSql, orderId, item.getProductId(), item.getProductName(), item.getPrice(), item.getQuantity());
        }

        return "redirect:/orders";
    }

    @GetMapping("/cart")
    public String viewCart(Model model) {
        // 從 products 表中檢索商品資料
        String sql = "SELECT product_id AS productId, name, category, price, image_url AS imageUrl, created_at, updated_at FROM products";
        List<ProductDto> products = jdbcTemplate.query(sql, (rs, rowNum) -> {
            ProductDto product = new ProductDto();
            product.setProductId(rs.getInt("productId"));
            product.setName(rs.getString("name"));
            product.setCategory(rs.getString("category"));
            product.setPrice(rs.getInt("price"));
            product.setImageUrl(rs.getString("imageUrl"));
            product.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
            product.setUpdatedAt(rs.getTimestamp("updated_at").toLocalDateTime());
            return product;
        });

        model.addAttribute("products", products);
        return "cart"; // 返回 cart.jsp 視圖
    }

    @PostMapping("/addItem")
    @ResponseBody
    public String addItemToCart(@RequestBody OrderItemDto orderItem) {
        String sql = "INSERT INTO cart_items (customer_id, product_id, quantity, created_at, updated_at) VALUES (?, ?, ?, NOW(), NOW())";
        jdbcTemplate.update(sql, orderItem.getCustomerId(), orderItem.getProductId(), orderItem.getQuantity());
        return "{\"success\": true}";
    }

    @GetMapping("/cartItems")
    @ResponseBody
    public List<OrderItemDto> getCartItems(@RequestParam("customerId") int customerId) {
        String sql = "SELECT ci.cart_item_id AS orderItemId, ci.product_id AS productId, p.name AS productName, p.price, ci.quantity, p.image_url AS imageUrl " +
                     "FROM cart_items ci " +
                     "JOIN products p ON ci.product_id = p.product_id " +
                     "WHERE ci.customer_id = ?";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(OrderItemDto.class), customerId);
    }

    @PostMapping("/removeItem")
    @ResponseBody
    public String removeCartItem(@RequestBody OrderItemDto orderItem) {
        String sql = "DELETE FROM cart_items WHERE customer_id = ? AND product_id = ?";
        jdbcTemplate.update(sql, orderItem.getCustomerId(), orderItem.getProductId());
        return "{\"success\": true}";
    }
}
