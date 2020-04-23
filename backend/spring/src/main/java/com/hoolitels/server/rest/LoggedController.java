package com.hoolitels.server.rest;

import com.hoolitels.server.entity.Booking;
import com.hoolitels.server.entity.User;
import com.hoolitels.server.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;


@RestController
@RequestMapping("/api") // Parent-URL:n för denna klass
public class LoggedController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/whoami")
    public User getLoggedInUser(Principal principal) {
        return userRepository.findByName(principal.getName());
    }
}
