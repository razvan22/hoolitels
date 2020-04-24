package com.hoolitels.server.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import javax.persistence.*;

@Entity
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private int rating;

    @Column(nullable = true)
    private String text;

    @ManyToOne(fetch=FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name="hotel_id", nullable = false)
    @JsonBackReference()
    private Hotel hotel;

    @ManyToOne(fetch=FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name="user_id", nullable = false)
    @JsonBackReference("userBackReference")
    private User user;

    public Review() {
    }

    public void setText(String text) {
        this.text = text;
    }

    public long getId() {
        return id;
    }

    public String getText() {
        return text;
    }

    public int getRating() {
        return rating;
    }

    public String getUser() {
        return user.getName();
    }

    public long getUser_id() {
        return user.getId();
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getHotel() {
        return hotel.getName();
    }

    public long getHotel_id() {
        return hotel.getId();
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }
}
