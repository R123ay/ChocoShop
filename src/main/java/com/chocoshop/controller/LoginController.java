package com.chocoshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
public class LoginController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @PostMapping("/login")
    public ModelAndView login(@RequestParam("username") String username, 
                              @RequestParam("password") String password) {
        String sql = "SELECT role FROM users WHERE username = ? AND password = ?";
        try {
            Map<String, Object> result = jdbcTemplate.queryForMap(sql, username, password);
            String role = (String) result.get("role");

            if ("ADMIN".equals(role)) {
                return new ModelAndView("redirect:/admin");
            } else if ("CUSTOMER".equals(role)) {
                return new ModelAndView("redirect:/cart");
            } else {
                return new ModelAndView("login", "error", "Invalid role");
            }
        } catch (Exception e) {
            return new ModelAndView("login", "error", "Invalid username or password");
        }
    }
}
