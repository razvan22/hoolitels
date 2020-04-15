package com.hoolitels.server.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Roombooking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne(fetch=FetchType.LAZY,cascade = CascadeType.ALL)
    @JoinColumn(name = "booking_id", nullable = false)
    @JsonBackReference
    @MapsId
    private Booking booking;

    @ManyToOne
    @JoinColumn(name = "room_id", nullable = false)
    private Room room;

    @Column(nullable = false)
    private boolean extra_bed;

    @Column(nullable = false)
    private Integer food_cost;

    public long getId() {
        return id;
    }

    public Booking getBooking() {
        return booking;
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
