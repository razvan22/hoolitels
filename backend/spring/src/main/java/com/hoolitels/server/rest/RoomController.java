package com.hoolitels.server.rest;

import com.hoolitels.server.entity.Room;
import com.hoolitels.server.repository.RoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("rest/room") // Parent-URL:n för denna klass
public class RoomController {
    @Autowired
    private RoomRepository roomRepository;

    @GetMapping
    public Iterable<Room> getAllRoom() {
        return roomRepository.findAll();
    }

    @GetMapping("{id}")
    public Optional<Room> getSpecificRoom(@PathVariable long id) {
        return roomRepository.findById(id);
    }

    @PostMapping
    public Room createRoom(@RequestBody Room roomToBeCreated) {
        return roomRepository.save(roomToBeCreated);
    }

    @DeleteMapping("all")
    private void deleteAllRooms() {
        roomRepository.deleteAll();
    }

    @DeleteMapping("{id}")
    public void deleteRoom(@PathVariable long id) {
        roomRepository.deleteById(id);
    }
}
