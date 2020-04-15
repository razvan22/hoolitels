package com.hoolitels.server.rest;

import com.hoolitels.server.entity.*;
import com.hoolitels.server.repository.AmenityRepository;
import com.hoolitels.server.repository.BookingRepository;
import com.hoolitels.server.repository.RoomRepository;
import com.hoolitels.server.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Optional;
import java.util.Set;
import java.util.function.Predicate;

@RestController
@RequestMapping("rest/booking") // Parent-URL:n för denna klass
public class BookingController {

    @Autowired
    private BookingRepository bookingRepository;

    @Autowired
    private RoomRepository roomRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping
    public Iterable<Booking> getAllUsers() {
        return bookingRepository.findAll();
    }

    @GetMapping("{id}")
    public Optional<Booking> getSpecificBooking(@PathVariable long id) {
        return bookingRepository.findById(id);
    }

    @PostMapping
    @Transactional
    public Booking createBooking(@RequestBody Booking booking) {
        Optional<User> userOpt = userRepository.findById(booking.getUser().getId());
        if (userOpt.isEmpty()) return null;

        booking.setUser(userOpt.get());

        Set<Roombooking> rbs = booking.getRoombookings();
        System.out.println("Hej hopp när vi ska skapa en bokning!!! " + rbs);
        if (!rbs.stream().allMatch(rb -> checkMatches(rb, booking.getStart_date(), booking.getEnd_date()))) return null;
        System.out.println("Hej efter allMatch....");
        return bookingRepository.save(booking);
    } // createBooking

    private boolean checkMatches(Roombooking rb, Date start, Date end) {
        Optional<Room> roomOpt = roomRepository.findById(rb.getRoom().getId());

        if (roomOpt.isEmpty()) return false;
        System.out.println("Optional not empty - wohoo!");
        System.out.println("Is room free? " +  roomOpt.get().isFree(start, end));
        return roomOpt.get().isFree(start, end);
    } // checkMatches
}
