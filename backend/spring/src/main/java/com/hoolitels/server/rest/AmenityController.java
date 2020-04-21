package com.hoolitels.server.rest;

import com.hoolitels.server.entity.Amenity;
import com.hoolitels.server.repository.AmenityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
@RequestMapping("rest/amenity") // Parent-URL:n för denna klass
public class AmenityController {
    @Autowired
    private AmenityRepository amenityRepository;

    @GetMapping
    public Iterable<Amenity> getAllAmenity() {
        return amenityRepository.findAll();
    }

    @GetMapping("{id}")
    public Optional<Amenity> getSpecificAmenity(@PathVariable long id) {
        return amenityRepository.findById(id);
    }
}
