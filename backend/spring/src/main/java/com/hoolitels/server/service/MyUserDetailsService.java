package com.hoolitels.server.service;

import com.hoolitels.server.entity.User;
import com.hoolitels.server.repository.CountryRepository;
import com.hoolitels.server.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;

@Service
public class MyUserDetailsService implements UserDetailsService {
    private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CountryRepository countryRepository;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User user = userRepository.findByEmail(s);

        if (user == null) {
            throw new UsernameNotFoundException("Login failed!");
        }
        return toUserDetails(user);
    }

    @PostConstruct
    private void addDefaultUser() {
        User u;
        if (userRepository.findByName("user") != null) return;

        u = new User();
        u.setName("user");
        u.setEmail("user");
        u.setAddress("uservejen 1");
        u.setPassword("user");
        u.setZip("11111");
        u.setCity("usercity");
        u.setPhone("012345678");
        u.setCountry(countryRepository.findById(227L));
        try {
            userRepository.save(u);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private UserDetails toUserDetails(User user) {
        return org.springframework.security.core.userdetails.User
                .withUsername(user.getName())
                .password(getEncoder().encode(user.getPassword())) // Fusk eftersom vi har genererade lösenord i databasen - gör inte detta "pauw riktigt".
                .roles("USER")
                .build();
    }

    public BCryptPasswordEncoder getEncoder() {
        return encoder;
    }
}
