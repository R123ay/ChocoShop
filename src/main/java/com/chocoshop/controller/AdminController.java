package com.chocoshop.controller;

import com.chocoshop.model.dto.OrderDto;
import com.chocoshop.model.dto.OrderItemDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping
    public String adminHome(Model model) {
        return "admin";
    }

    @GetMapping("/orders")
    public String viewOrders(Model model) {
        String sql = "SELECT * FROM orders";
        List<OrderDto> orders = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(OrderDto.class));
        model.addAttribute("orders", orders);
        return "orders";
    }


    @GetMapping("/orders/{orderId}")
    @ResponseBody
    public String viewOrderDetails(@PathVariable int orderId, Model model) {
        String sql = "SELECT * FROM order_items WHERE order_id = ?";
        List<OrderItemDto> orderItems = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(OrderItemDto.class), orderId);
        model.addAttribute("orderItems", orderItems);

        sql = "SELECT * FROM orders WHERE order_id = ?";
        OrderDto order = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(OrderDto.class), orderId);
        model.addAttribute("order", order);

        return generateOrderDetailsHtml(order, orderItems);
    }

    private String generateOrderDetailsHtml(OrderDto order, List<OrderItemDto> orderItems) {
        StringBuilder html = new StringBuilder();
        html.append("<div><strong>顧客姓名:</strong> ").append(order.getName()).append("</div>");
        html.append("<div><strong>電話:</strong> ").append(order.getPhone()).append("</div>");
        html.append("<div><strong>電子信箱:</strong> ").append(order.getEmail()).append("</div>");
        html.append("<div><strong>付款方式:</strong> ").append(order.getPaymentMethod()).append("</div>");
        html.append("<div><strong>預定到貨日期:</strong> ").append(order.getDeliveryDate()).append("</div>");
        html.append("<div><strong>購買日期:</strong> ").append(order.getPurchaseDate()).append("</div>");
        html.append("<h2 class=\"section-header\">購買品項</h2>");
        html.append("<table class=\"table table-striped\"><thead><tr><th>品名</th><th>數量</th><th>單價</th><th>總價</th></tr></thead><tbody>");

        for (OrderItemDto item : orderItems) {
            html.append("<tr><td>").append(item.getProductId()).append("</td>");
            html.append("<td>").append(item.getQuantity()).append("</td>");
            html.append("<td>").append(item.getTotalPrice() / item.getQuantity()).append("</td>");
            html.append("<td>").append(item.getTotalPrice()).append("</td></tr>");
        }
        html.append("</tbody></table>");
        html.append("<div class=\"cart-total\"><strong class=\"cart-total-title\">總計</strong><span class=\"cart-total-price\">$").append(order.getTotalPrice()).append("</span></div>");

        return html.toString();
    }
}
