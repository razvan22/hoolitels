package com.hoolitels.server.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String url;

    @Column(nullable = false)
    private String name;

    @Column(nullable = true)
    private String desc;

    @ManyToOne
    @JoinColumn(name="room_id", nullable = true)
    @JsonBackReference("imageRoomBackReference")
    private Room room;

    @ManyToOne
    @JoinColumn(name="hotel_id", nullable = true)
    @JsonBackReference("imageHotelBackReference")
    private Hotel hotel;

    public Image() {
    }

    public String getUrl() {
        return url;
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
