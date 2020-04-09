package com.hoolitels.server.repository;

import com.hoolitels.server.entity.City;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CityRepository extends CrudRepository<City, Long> {
    City findByName(String name);
    List<City> findAllByName(String name);
}
