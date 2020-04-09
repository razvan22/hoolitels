package com.hoolitels.server.entity;

import javax.persistence.*;
import java.util.Set;

@Entity
public class City {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String name;

    @OneToMany(mappedBy = "city")
    private Set<Hotel> hotels;

    public Set<Hotel> getHotels() {
        return hotels;
    }

    public City() {
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
