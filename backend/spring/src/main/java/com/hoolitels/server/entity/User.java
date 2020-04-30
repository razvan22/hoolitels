package com.hoolitels.server.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.util.Optional;
import java.util.Set;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String address;

    @Column(nullable = false)
    private String zip;

    @Column(nullable = false)
    private String city;

    @Column(nullable = false)
    private String phone;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    @JsonManagedReference("userBookingBackReference")
    private Set<Booking> bookings;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
    @JsonManagedReference("reviewBackReference")
    private Set<Review> reviews;

//    @ManyToOne(fetch=FetchType.LAZY, cascade = CascadeType.ALL)
//    @JoinColumn(name = "country_id", nullable = false)
//    @JsonBackReference("userCountryBackReference")
//    private Country country;
    private long country_id;

    public User(){}

    public void setId(long id) {
        this.id = id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

//    public String getCountryName() {
//        return country.getName();
//    }

    public long getCountry_id() {
        return country_id;
    }

    public void setName(String name) {
        this.name = name;
    }

    @JsonProperty
    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public long getId() {
        return id;
    }

    @JsonIgnore
    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public Set<Booking> getBookings() {
        return bookings;
    }

    public boolean verifyPassword(String password) {
        return getPassword().equals(password);
    }

    public Set<Review> getReviews() {
        return reviews;
    }

//    public void setCountry(Optional<Country> country) {
//        this.country = country.orElse(null);
//    }

    public void setCountry_id(long country_id) {
        this.country_id = country_id;
    }
}
