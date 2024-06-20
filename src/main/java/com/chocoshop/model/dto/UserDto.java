package com.chocoshop.model.dto;

import lombok.Data;

@Data
public class UserDto {
    private int id;
    private String username;
    private String password;
    private String name;
    private String email;
    private String phone;
    private String birthday;
    private String role;
}
