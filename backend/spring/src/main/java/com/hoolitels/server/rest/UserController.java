package com.hoolitels.server.rest;

import com.hoolitels.server.entity.User;
import com.hoolitels.server.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("rest/user") // Parent-URL:n för denna klass
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping
    public Iterable<User> getAllUsers() {
        return userRepository.findAll();
    }

    @GetMapping("{id}")
    public Optional<User> getSpecificUser(@PathVariable long id) {
        return userRepository.findById(id);
    }

    @PostMapping
    public User createUser(@RequestBody User userToBeCreated) {
        return userRepository.save(userToBeCreated);
    }

    @DeleteMapping("all")
    private void deleteAllUsers() {
        userRepository.deleteAll();
    }

    @DeleteMapping("{id}")
    public void deleteUser(@PathVariable long id) {
        userRepository.deleteById(id);
    }
}
