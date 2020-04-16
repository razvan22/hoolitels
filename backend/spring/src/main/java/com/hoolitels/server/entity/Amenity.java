package com.hoolitels.server.entity;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Amenity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String name;

    @ManyToMany(mappedBy = "amenities")
    private Set<Hotel> hotels;

    public Amenity() {
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

//    public Set<Hotel> getHotels() {
//        return hotels;
//    }
}
