package com.hoolitels.server.rest;

//import com.hoolitels.server.entity.City;
import com.hoolitels.server.entity.Hotel;
import com.hoolitels.server.entity.Room;
//import com.hoolitels.server.repository.CityRepository;
import com.hoolitels.server.repository.HotelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;
import java.util.Set;

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

    @GetMapping("{id}/rooms")
    public Set<Room> getHotelsBySpecificCity(@PathVariable long id) {
        Optional<Hotel> hotel = hotelRepository.findById(id);
        // TODO: 2020-04-09 Bra att returnera null när hotellet inte finns?
        return (hotel.isEmpty() ? null : hotel.get().getRooms());
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
