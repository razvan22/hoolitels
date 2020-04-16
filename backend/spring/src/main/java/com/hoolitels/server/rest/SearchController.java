package com.hoolitels.server.rest;

import com.hoolitels.server.entity.*;
import com.hoolitels.server.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.Optional;

@RestController
@RequestMapping("rest/search") // Parent-URL:n för denna klass
public class SearchController {

    @Autowired
    private BookingRepository bookingRepository;

    @Autowired
    private HotelRepository hotelRepository;

    @Autowired
    private CityRepository cityRepository;

    @GetMapping
    public Iterable<Hotel> getAllHotelsByCity(@RequestParam(required = false) Long city_id) {
        if(city_id == null) {
            return hotelRepository.findAll();
        }

        Optional<City> city = cityRepository.findById(city_id);
        if (city.isEmpty()) return null;

        return hotelRepository.findAllByCity(city.get());
    }
}
