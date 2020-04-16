package com.hoolitels.server.repository;

import com.hoolitels.server.entity.Amenity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AmenityRepository extends CrudRepository<Amenity, Long> {
    Amenity findByName(String name);
    List<Amenity> findAllByName(String name);
}
