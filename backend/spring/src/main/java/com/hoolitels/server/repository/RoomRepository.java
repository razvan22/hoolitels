package com.hoolitels.server.repository;

import com.hoolitels.server.entity.City;
import com.hoolitels.server.entity.Room;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoomRepository extends CrudRepository<Room, Long> {
//    Room findByName(String name);
//    List<Room> findAllByName(String name);
}
