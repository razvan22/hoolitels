package com.hoolitels.server.entity;

import com.fasterxml.jackson.annotation.*;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Roombooking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name = "booking_id", nullable = false)
    @JsonBackReference("roomBookingBackReference")
    private Booking booking;

    @ManyToOne()
    @JoinColumn(name = "room_id", nullable = false)
    @JsonBackReference("roomBookingsRoomBackReference")
    private Room room;

    @Column(nullable = true)
    private int extra_bed;

    @Column(nullable = true)
    private Integer food_cost;

    @Column(nullable = false)
    private Integer room_cost;

    public Roombooking() {
    }

//    public Roombooking(long booking, Room room, boolean extra_bed, Integer food_cost) {
    public Roombooking(Booking booking, Room room, Integer extra_bed, Integer food_cost, Integer room_cost) {
        this.booking = booking;
        this.room = room;
        this.extra_bed = extra_bed;
        this.food_cost = food_cost;
        this.room_cost = room_cost;
    }

    public long getId() {
        return id;
    }

    public Booking getBooking() {
        return booking;
    }

    public long getBooking_id(){
        return booking.getId();
    }

    public long getRoom_id() {
        return room.getId();
    }

    public Room getRoom() {
        return room;
    }

    public Integer getFood_cost() {
        return food_cost;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public int getExtra_bed() {
        return extra_bed;
    }

    public void setExtra_bed(int extra_bed) {
        this.extra_bed = extra_bed;
    }

    public void setFood_cost(Integer food_cost) {
        this.food_cost = food_cost;
    }

    public Integer getRoom_cost() {
        return room_cost;
    }

    public void setRoom_cost(Integer room_cost) {
        this.room_cost = room_cost;
    }
}
