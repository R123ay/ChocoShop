package com.chocoshop.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.chocoshop.model.dto.UserDto;
import com.chocoshop.model.po.User;

@Service
public class UserService {
    @Autowired
    private UserDto userDto;

    public User findByUsername(String username) {
        return userDto.findByUsername(username);
    }

    public List<User> getAllUsers() {
        return userDto.findAll();
    }

    public Integer saveUser(User user) {
        return userDto.add(user);
    }

    public Integer updateUser(User user) {
        return userDto.update(user);
    }

    public Integer deleteUser(Integer id) {
        return userDto.deleteById(id);
    }
}
