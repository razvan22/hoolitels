package com.hoolitels.server.repository;

import com.hoolitels.server.entity.Amenity;
import com.hoolitels.server.entity.Booking;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BookingRepository extends CrudRepository<Booking, Long> {

}
