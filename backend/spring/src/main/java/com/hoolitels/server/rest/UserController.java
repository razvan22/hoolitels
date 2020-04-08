package com.hoolitels.server.rest;

import com.hoolitels.server.entity.User;
import com.hoolitels.server.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;
import java.util.Optional;

@RestController
@RequestMapping("rest/user") // Parent-URL:n för denna klass
public class UserController {

    @Autowired
    private UserRepository userRepository;

//    @Autowired
//    // Adding this Qualifier will make us inject usingUserServiceFactory::createService instead of a default injection of the class
//    @Qualifier("createService")
//    private UserService userService;

    @PostConstruct
    void thisFunctionWillRunAfterConstruction() {

        // TODO: 2020-04-08 new user params
        var rootUser = userRepository.findByName("root");
        if (rootUser == null) {
            userRepository.save(new User());
        }
    }

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
