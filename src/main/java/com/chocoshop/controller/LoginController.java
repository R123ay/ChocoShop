package com.chocoshop.controller;

import com.chocoshop.model.dto.UserDto;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.dao.EmptyResultDataAccessException;

@Controller
public class LoginController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/login")
    public String showLoginForm(@RequestParam(value = "success", required = false) String success, Model model) {
        model.addAttribute("error", ""); // 確保初始時沒有錯誤訊息
        if (success != null) {
            model.addAttribute("success", success);
        }
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session, Model model) {
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        try {
            UserDto user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(UserDto.class), username, password);
            if (user != null) {
                session.setAttribute("user", user);
                if ("ADMIN".equals(user.getRole())) {
                    return "redirect:/admin";
                } else if ("CUSTOMER".equals(user.getRole())) {
                    return "redirect:/cart";
                } else {
                    model.addAttribute("error", "未知的用戶角色");
                    return "login";
                }
            } else {
                model.addAttribute("error", "帳號或密碼錯誤，請再試一次");
                return "login";
            }
        } catch (EmptyResultDataAccessException e) {
            model.addAttribute("error", "帳號或密碼錯誤，請再試一次");
            return "login";
        }
    }

    @GetMapping("/register")
    public String showRegisterForm() {
        return "register";
    }

    @PostMapping("/register")
    public String register(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("phone") String phone,
            @RequestParam("birthday") String birthday,
            Model model) {
        // 設置默認角色為 CUSTOMER
        String role = "CUSTOMER";
        
        // 確認密碼長度是否滿足要求
        if (password.length() < 6) {
            model.addAttribute("error", "密碼必須至少包含 6 位數字或字母");
            return "register";
        }

        // 確認電話號碼長度是否為 10 位
        if (phone.length() != 10) {
            model.addAttribute("error", "電話號碼必須為 10 位");
            return "register";
        }

        String sql = "INSERT INTO users (username, password, name, email, phone, birthday, role) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            jdbcTemplate.update(sql, username, password, name, email, phone, birthday, role);
            model.addAttribute("success", "恭喜註冊成功，5 秒後自動跳轉到登入頁面。");
            return "register";
        } catch (Exception e) {
            model.addAttribute("error", "註冊失敗，請再試一次");
            return "register";
        }
    }

    @GetMapping("/forgot-password")
    public String showForgotPasswordForm() {
        return "forgot-password";
    }

    @PostMapping("/forgot-password")
    public String forgotPassword(
            @RequestParam("username") String username,
            @RequestParam("phone") String phone,
            @RequestParam("email") String email,
            @RequestParam("newPassword") String newPassword,
            Model model) {
        String sql = "SELECT * FROM users WHERE username = ? AND phone = ? AND email = ?";
        try {
            UserDto user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(UserDto.class), username, phone, email);
            if (user != null) {
                String updateSql = "UPDATE users SET password = ? WHERE username = ?";
                jdbcTemplate.update(updateSql, newPassword, username);
                model.addAttribute("success", "密碼修改成功，5 秒後自動跳轉到登入頁面。");
                return "forgot-password";
            } else {
                model.addAttribute("error", "驗證失敗，請確認您的帳號、手機和電子郵件");
                return "forgot-password";
            }
        } catch (EmptyResultDataAccessException e) {
            model.addAttribute("error", "驗證失敗，請確認您的帳號、手機和電子郵件");
            return "forgot-password";
        }
    }
}
