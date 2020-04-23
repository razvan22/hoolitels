package com.hoolitels.server.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Entity
public class Hotel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String zip;

    @OneToMany(mappedBy = "hotel")
    private Set<Image> images;

    @OneToMany(mappedBy = "hotel")
    private List<Room> rooms = new ArrayList<>();

    @ManyToMany()
    @JoinTable(
            name = "hotelamenity",
            joinColumns = @JoinColumn(name = "hotel_id"),
            inverseJoinColumns = @JoinColumn(name = "amenity_id"))
    private Set<Amenity> amenities;

    @ManyToOne
    @JoinColumn(name = "city_id", nullable = false)
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

    @OneToMany(mappedBy = "hotel")
    @JsonManagedReference
    private List<Review> reviews = new ArrayList<>();

    public Hotel() {
    }

    public List<Room> getRooms() {
        return rooms;
    }

    public String getCity() {
        return city.getName();
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

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public Set<Image> getImages() {
        return images;
    }

    public int getDistance_to_town_center() {
        return distance_to_town_center;
    }

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

    public Set<Amenity> getAmenities() {
        return amenities;
    }

    public List<Room> getFreeRooms(Date start_date, Date end_date) {
        List<Room> list = rooms.stream()
                .filter(r -> r.isFree(start_date, end_date))
                .collect(Collectors.toList());

        this.rooms = list;

        return list;
    }

    public boolean hasAmenity(long amenity_id) {
        return amenities.stream()
                .anyMatch(amenity -> amenity.getId() == amenity_id);
    }

    public boolean hasAllAmenities(List<Long> list) {
        return list.stream()
                .allMatch(this::hasAmenity);
    }

    public List<Review> getReviews() {
        return reviews;
    }
}
