package com.hoolitels.server.rest;

import com.hoolitels.server.entity.Booking;
import com.hoolitels.server.entity.User;
import com.hoolitels.server.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import javax.annotation.security.RolesAllowed;
import java.security.Principal;
import java.util.Optional;
import java.util.Set;

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
       return isCurrentUser(id) ? userRepository.findById(id) : null;
    }

    @PostMapping
    public User createUser(@RequestBody User userToBeCreated) {
//        Optional<Country> cOpt = countryRepository.findById(userToBeCreated.getCountry_id());
//        if (cOpt.isEmpty()) return null;
//
//        userToBeCreated.setCountry(cOpt.get());
        return userRepository.save(userToBeCreated);
    }

    @RolesAllowed("ROLE_ADMIN")
    @DeleteMapping("all")
    private void deleteAllUsers() {
//        UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//        Collection<? extends GrantedAuthority> auth = user.getAuthorities();
//        if (user.getAuthorities().contains("ROLE_ADMIN")) userRepository.deleteAll();
        userRepository.deleteAll();
    }

    public String currentUserName(Principal principal) {
        return principal.getName();
    }

    @DeleteMapping("{id}")
    public void deleteUser(@PathVariable long id) {
        if (isCurrentUser(id)) userRepository.deleteById(id);
    }

    public boolean isCurrentUser(long id) {
        UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return (userRepository.findByName(user.getUsername()).getId() == id);
    }

    @GetMapping("{id}/bookings")
    public Set<Booking> getBookingsBySpecificUser(@PathVariable long id) {
        if (!isCurrentUser(id)) return null;

        Optional<User> user = userRepository.findById(id);
        return (user.isEmpty() ? null : user.get().getBookings());
    }
}
