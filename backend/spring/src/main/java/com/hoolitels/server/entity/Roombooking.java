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

    @Column(nullable = false)
    private boolean extra_bed;

    @Column(nullable = false)
    private Integer food_cost;

    public Roombooking() {
    }

//    public Roombooking(long booking, Room room, boolean extra_bed, Integer food_cost) {
    public Roombooking(Booking booking, Room room, boolean extra_bed, Integer food_cost) {
//        this.booking_id = booking;
        this.booking = booking;
        this.room = room;
        this.extra_bed = extra_bed;
        this.food_cost = food_cost;
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

    public boolean isExtra_bed() {
        return extra_bed;
    }

    public Integer getFood_cost() {
        return food_cost;
    }
}
