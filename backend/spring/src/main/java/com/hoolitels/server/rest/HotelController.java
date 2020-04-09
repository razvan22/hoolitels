package com.hoolitels.server.rest;

import com.hoolitels.server.entity.Hotel;
import com.hoolitels.server.repository.HotelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("rest/hotel") // Parent-URL:n för denna klass
public class HotelController {

    @Autowired
    private HotelRepository hotelRepository;

    @GetMapping
    public Iterable<Hotel> getAllHotels() {
        return hotelRepository.findAll();
    }

    @GetMapping("{id}")
    public Optional<Hotel> getSpecificHotel(@PathVariable long id) {
        return hotelRepository.findById(id);
    }

    @PostMapping
    public Hotel createHotel(@RequestBody Hotel hotelToBeCreated) {
        return hotelRepository.save(hotelToBeCreated);
    }

    @DeleteMapping("all")
    private void deleteAllHotels() {
        hotelRepository.deleteAll();
    }

    @DeleteMapping("{id}")
    public void deleteHotel(@PathVariable long id) {
        hotelRepository.deleteById(id);
    }
}
