package com.hoolitels.server.repository;

import com.hoolitels.server.entity.Amenity;
import com.hoolitels.server.entity.Review;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends CrudRepository<Review, Long> {

}
