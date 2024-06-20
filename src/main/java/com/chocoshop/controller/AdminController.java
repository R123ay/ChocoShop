package com.chocoshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    @GetMapping("/admin")
    public String adminHome(Model model) {
        // 在這裡添加需要顯示的數據，例如商品列表、顧客資料等
        // model.addAttribute("products", productService.getAllProducts());
        // model.addAttribute("customers", customerService.getAllCustomers());
        // model.addAttribute("orders", orderService.getAllOrders());
        return "admin";
    }
}
