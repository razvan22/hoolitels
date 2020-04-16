package com.hoolitels.server.rest;

import com.hoolitels.server.entity.User;
import com.hoolitels.server.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("oldlogin") // Parent-URL:n för denna klass
public class OldLoginController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping
    public User login(@RequestParam(name = "email") String email, @RequestParam String password) {

        User user = userRepository.findByEmail(email);
        if(user != null) {
            return user.verifyPassword(password) ? user : null;
        } else {
            return null;
        }
    }
}
