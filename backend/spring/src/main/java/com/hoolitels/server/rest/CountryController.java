package com.hoolitels.server.rest;

import com.hoolitels.server.entity.Country;
import com.hoolitels.server.entity.Hotel;
import com.hoolitels.server.repository.CountryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;
import java.util.Set;

@RestController
@RequestMapping("rest/country") // Parent-URL:n för denna klass
public class CountryController {

    @Autowired
    private CountryRepository countryRepository;

    @GetMapping
    public Iterable<Country> getAllCountry() {
        return countryRepository.findAll();
    }

    @GetMapping("{id}")
    public Optional<Country> getSpecificCountry(@PathVariable long id) {
        return countryRepository.findById(id);
    }
}
