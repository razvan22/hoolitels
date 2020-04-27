package com.hoolitels.server.rest;

import com.hoolitels.server.entity.*;
import com.hoolitels.server.repository.BookingRepository;
import com.hoolitels.server.repository.RoomRepository;
import com.hoolitels.server.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.*;

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
    public Iterable<Booking> getAllBookings() {
        return bookingRepository.findAll();
    }

    @GetMapping("{id}")
    public Optional<Booking> getSpecificBooking(@PathVariable long id) {
        return bookingRepository.findById(id);
    }

    @PostMapping
    public Booking createBooking(@RequestBody Booking booking) {
        Optional<User> userOpt = userRepository.findById(booking.getUserRec().getId());
        if (userOpt.isEmpty()) return null;

        booking.setUser(userOpt.get());

        ArrayList<Roombooking> rbLocal = new ArrayList<Roombooking>();
        booking.getRoombookings().forEach(rb ->
                rbLocal.add(new Roombooking(booking,
                                            (roomRepository.findById(rb.getRoom().getId())).get(),
                                            rb.isExtra_bed(),
                                            rb.getFood_cost())));
        booking.setRoomBookings(rbLocal);

        List<Roombooking> rbs = booking.getRoombookings();
        if (!rbs.stream().allMatch(rb -> checkMatches(rb, booking.getStart_date(), booking.getEnd_date()))) return null;
        return bookingRepository.save(booking);
    } // createBooking

    private boolean checkMatches(Roombooking rb, Date start, Date end) {
        Optional<Room> roomOpt = roomRepository.findById(rb.getRoom().getId());

        if (roomOpt.isEmpty()) return false;
        return roomOpt.get().isFree(start, end);
    } // checkMatches
}
