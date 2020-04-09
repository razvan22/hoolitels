package com.hoolitels.server.entity;

import javax.persistence.*;
import java.sql.Time;

@Entity
public class Hotel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String zip;

//    @Column(nullable = false)
//    private int city_id;

    public String getCity() {
        return city.getName();
    }

    @ManyToOne
    @JoinColumn(name="city_id", nullable = false)
    private City city;

    private String desc;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String phone;

    private int distance_to_beach;

    private int distance_to_town_center;

    @Column(nullable = false)
    private Time checkin_time;

    @Column(nullable = false)
    private Time checkout_time;

    public Hotel() {
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

//    public int getCity_id() {
//        return city_id;
//    }
//
//    public void setCity_id(int city_id) {
//        this.city_id = city_id;
//    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getDistance_to_beach() {
        return distance_to_beach;
    }

    public void setDistance_to_beach(int distance_to_beach) {
        this.distance_to_beach = distance_to_beach;
    }

    public int getDistance_to_town() {
        return distance_to_town_center;
    }

    public void setDistance_to_town(int distance_to_town_center) {
        this.distance_to_town_center = distance_to_town_center;
    }

    public Time getCheckin_time() {
        return checkin_time;
    }

    public void setCheckin_time(Time checkin_time) {
        this.checkin_time = checkin_time;
    }

    public Time getCheckout_time() {
        return checkout_time;
    }

    public void setCheckout_time(Time checkout_time) {
        this.checkout_time = checkout_time;
    }


}
