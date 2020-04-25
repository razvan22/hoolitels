package com.hoolitels.server.rest;

import com.hoolitels.server.entity.Hotel;
import com.hoolitels.server.entity.Review;
import com.hoolitels.server.entity.User;
import com.hoolitels.server.repository.HotelRepository;
import com.hoolitels.server.repository.ReviewRepository;
import com.hoolitels.server.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("rest/review") // Parent-URL:n för denna klass
public class ReviewController {
    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private HotelRepository hotelRepository;

    @GetMapping
    public Iterable<Review> getAllReviews() {
        return reviewRepository.findAll();
    }

    @GetMapping("{id}")
    public Optional<Review> getSpecificReview(@PathVariable long id) {
        return reviewRepository.findById(id);
    }

    @PostMapping
    public Review createReview(@RequestBody Review review) {
        Optional<User> userOpt = userRepository.findById(review.getUser_id());
        Optional<Hotel> hotelOpt = hotelRepository.findById(review.getHotel_id());
        if (userOpt.isEmpty()) return null;
        if (hotelOpt.isEmpty()) return null;

        review.setUser(userOpt.get());
        review.setHotel(hotelOpt.get());

        return reviewRepository.save(review);
    } // createReview
}