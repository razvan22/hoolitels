package com.hoolitels.server.rest;

import com.hoolitels.server.entity.City;
import com.hoolitels.server.entity.Hotel;
import com.hoolitels.server.repository.CityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;
import java.util.Set;

@RestController
@RequestMapping("rest/city") // Parent-URL:n för denna klass
public class CityController {

    @Autowired
    private CityRepository cityRepository;

    @GetMapping
    public Iterable<City> getAllCity() {
        return cityRepository.findAll();
    }

    @GetMapping("{id}")
    public Optional<City> getSpecificCity(@PathVariable long id) {
        return cityRepository.findById(id);
    }

    @GetMapping("{id}/hotels")
    public Set<Hotel> getHotelsBySpecificCity(@PathVariable long id) {
        Optional<City> city = cityRepository.findById(id);
        // TODO: 2020-04-09 Bra att returnera null när staden inte finns?
        return (city.isEmpty() ? null : city.get().getHotels());
//        return (city.get().getHotels());
    }

    @PostMapping
    public City createCity(@RequestBody City cityToBeCreated) {
        return cityRepository.save(cityToBeCreated);
    }

    @DeleteMapping("all")
    private void deleteAllCitys() {
        cityRepository.deleteAll();
    }

    @DeleteMapping("{id}")
    public void deleteCity(@PathVariable long id) {
        cityRepository.deleteById(id);
    }
}
