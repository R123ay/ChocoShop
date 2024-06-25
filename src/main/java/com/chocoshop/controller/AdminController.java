package com.chocoshop.controller;

import com.chocoshop.model.dto.OrderDto;
import com.chocoshop.model.dto.OrderItemDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping("/orders/update")
    @ResponseBody
    public void updateOrder(
            @RequestParam int orderId,
            @RequestParam String status,
            @RequestParam String name,
            @RequestParam String phone,
            @RequestParam String email,
            @RequestParam String paymentMethod,
            @RequestParam String deliveryDate) {
        
        String sql = "UPDATE orders SET status = ?, name = ?, phone = ?, email = ?, payment_method = ?, delivery_date = ? WHERE order_id = ?";
        jdbcTemplate.update(sql, status, name, phone, email, paymentMethod, deliveryDate, orderId);
    }

    private String generateOrderDetailsHtml(OrderDto order, List<OrderItemDto> orderItems) {
        StringBuilder html = new StringBuilder();
        html.append("<input type='hidden' id='orderId' value='").append(order.getOrderId()).append("'>");
        html.append("<div><strong>顧客姓名:</strong> <input type='text' class='form-control editable' id='orderName' value='").append(order.getName()).append("' disabled></div>");
        html.append("<div><strong>電話:</strong> <input type='text' class='form-control editable' id='orderPhone' value='").append(order.getPhone()).append("' disabled></div>");
        html.append("<div><strong>電子信箱:</strong> <input type='email' class='form-control editable' id='orderEmail' value='").append(order.getEmail()).append("' disabled></div>");
        html.append("<div><strong>付款方式:</strong> <select id='orderPaymentMethodSelect' class='form-select editable' disabled>")
            .append("<option value='貨到付款'").append(order.getPaymentMethod().equals("貨到付款") ? " selected" : "").append(">貨到付款</option>")
            .append("<option value='ATM轉帳'").append(order.getPaymentMethod().equals("ATM轉帳") ? " selected" : "").append(">ATM轉帳</option>")
            .append("</select></div>");
        html.append("<div><strong>預定到貨日期:</strong> <input type='date' class='form-control editable' id='orderDeliveryDate' value='").append(order.getDeliveryDate()).append("' disabled></div>");
        html.append("<div><strong>訂單狀態:</strong> <select id='orderStatusSelect' class='form-select editable' disabled>")
            .append("<option value='待確認'").append(order.getStatus().equals("待確認") ? " selected" : "").append(">待確認</option>")
            .append("<option value='備貨中'").append(order.getStatus().equals("備貨中") ? " selected" : "").append(">備貨中</option>")
            .append("<option value='運送中'").append(order.getStatus().equals("運送中") ? " selected" : "").append(">運送中</option>")
            .append("<option value='已交貨'").append(order.getStatus().equals("已交貨") ? " selected" : "").append(">已交貨</option>")
            .append("<option value='處理中'").append(order.getStatus().equals("處理中") ? " selected" : "").append(">處理中</option>")
            .append("</select></div>");
        html.append("<h2 class='section-header'>購買品項</h2>");
        html.append("<table class='table table-striped'><thead><tr><th>品名</th><th>數量</th><th>單價</th><th>總價</th></tr></thead><tbody>");

        for (OrderItemDto item : orderItems) {
            html.append("<tr><td>").append(item.getProductId()).append("</td>");
            html.append("<td>").append(item.getQuantity()).append("</td>");
            html.append("<td>").append(item.getTotalPrice() / item.getQuantity()).append("</td>");
            html.append("<td>").append(item.getTotalPrice()).append("</td></tr>");
        }
        html.append("</tbody></table>");
        html.append("<div class='cart-total'><strong class='cart-total-title'>總計</strong><span class='cart-total-price'>$").append(order.getTotalPrice()).append("</span></div>");

        return html.toString();
    }
}
