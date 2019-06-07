package com.ssm.dao;

import com.ssm.model.User;

public interface UserDao {

    User login(String username);

    void registerByUsernameAndPassword(User user);
}

