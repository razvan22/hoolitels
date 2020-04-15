package com.hoolitels.server.repository;

import com.hoolitels.server.entity.City;
import com.hoolitels.server.entity.Hotel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HotelRepository extends CrudRepository<Hotel, Long> {
    Hotel findByName(String name);
    List<Hotel> findAllByCity(City city);
    List<Hotel> findAllByName(String name);
}
