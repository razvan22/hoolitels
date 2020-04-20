package com.hoolitels.server.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
public class Booking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne(fetch=FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id", nullable = false)
    @JsonBackReference
    private User user;

    @OneToMany(cascade = CascadeType.PERSIST, mappedBy = "booking")
//    @JsonManagedReference
    private List<Roombooking> roombookings = new ArrayList<>();

    @Column(nullable = false)
    private int num_adults;

    @Column(nullable = false)
    private int num_children;

    @Column(nullable = false)
    private int num_infants;

    @Temporal(TemporalType.DATE)
    @Column(nullable = false)
    private Date start_date;

    @Temporal(TemporalType.DATE)
    @Column(nullable = false)
    private Date end_date;

    @Column(nullable = true)
    private String comment;

    @Column(nullable = false)
    private boolean paid;

    public long getId() {
        return id;
    }

    public User getUser() {
        return user;
    }

    public int getNum_adults() {
        return num_adults;
    }

    public int getNum_children() {
        return num_children;
    }

    public int getNum_infants() {
        return num_infants;
    }

    public Date getStart_date() {
        return start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public String getComment() {
        return comment;
    }

    public List<Roombooking> getRoombookings() {
        return roombookings;
    }

    public boolean isPaid() {
        return paid;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setRoomBookings(List<Roombooking> roombookings) {
        this.roombookings = roombookings;
    }
}

