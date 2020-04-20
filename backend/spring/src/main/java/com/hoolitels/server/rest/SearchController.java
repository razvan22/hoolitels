package com.hoolitels.server.rest;

import com.hoolitels.server.entity.*;
import com.hoolitels.server.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

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
    public Iterable<Hotel> getAllHotelsByCity(@RequestBody SearchModel model) {
        List<Hotel> hotels;

        if (model == null || model.getCity_id() == null) {
            return hotelRepository.findAll();
        }

        Optional<City> city = cityRepository.findById(model.getCity_id());
        if (city.isEmpty()) return null;

        hotels = hotelRepository.findAllByCity(city.get());

        if (model.getStart_date() != null) {
            hotels = hotels.stream()
                    .filter(h -> !h.getFreeRooms(model.getStart_date(), model.getEnd_date()).isEmpty())
                    .collect(Collectors.toList());
        }

        if (model.getDistance_to_beach() != null) {
            hotels = hotels.stream()
                    .filter(h -> h.getDistance_to_beach() <= model.getDistance_to_beach())
                    .collect(Collectors.toList());
        }

        if (model.getDistance_to_town_center() != null) {
            hotels = hotels.stream()
                    .filter(h -> h.getDistance_to_town_center() <= model.getDistance_to_town_center())
                    .collect(Collectors.toList());
        }

        if (model.getAmenities() != null && !model.getAmenities().isEmpty()) {
            hotels = hotels.stream()
                    .filter(h -> h.hasAllAmenities(model.getAmenities()))
                    .collect(Collectors.toList());
        }

        return hotels;
    }
}
