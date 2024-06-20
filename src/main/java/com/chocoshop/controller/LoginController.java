package com.chocoshop.controller;

import com.chocoshop.model.dto.UserDto;
import jakarta.servlet.http.HttpSession;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.tree.RowMapper;
import javax.swing.tree.TreePath;

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
    public String showLoginForm(Model model) {
        model.addAttribute("error", ""); // 確保初始時沒有錯誤訊息
        return "login";
    }


    @PostMapping("/login")
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session, Model model) {
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        try {
            UserDto user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(UserDto.class), username, password);
            if (user != null) {
                session.setAttribute("user", user);
                session.setAttribute("customerId", user.getId()); // 將 customerId 儲存在會話中
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

    @GetMapping("/forgot-password")
    public String showForgotPasswordForm() {
        return "forgot-password";
    }

    static class UserRowMapper implements RowMapper {
        public UserDto mapRow(ResultSet rs, int rowNum) throws SQLException {
            UserDto user = new UserDto();
            user.setId(rs.getInt("id"));
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setRole(rs.getString("role"));
            return user;
        }

		@Override
		public int[] getRowsForPaths(TreePath[] path) {
			// TODO Auto-generated method stub
			return null;
		}
    }
}