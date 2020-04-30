package com.hoolitels.server.repository;

import com.hoolitels.server.entity.City;
import com.hoolitels.server.entity.Country;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CountryRepository extends CrudRepository<Country, Long> {
    Country findByName(String name);
    List<Country> findAllByName(String name);
}
