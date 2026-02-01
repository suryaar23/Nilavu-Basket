package com.nilavu.dao;

import java.util.List;
import com.nilavu.model.User;

public interface UserDAO {
    User login(String email, String password);
    boolean register(User user);
    List<User> getAllUsers();
}
