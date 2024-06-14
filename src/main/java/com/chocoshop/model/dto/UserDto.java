package com.chocoshop.model.dto;

import java.util.List;
import com.chocoshop.model.po.User;

public interface UserDto {
    User findByUsername(String username);
    List<User> findAll();
    Integer add(User user);
    Integer update(User user);
    Integer deleteById(Integer id);
}
