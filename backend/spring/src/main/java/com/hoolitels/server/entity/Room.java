package com.hoolitels.server.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.hoolitels.server.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private RoomType type;

    @Column(nullable = false)
    private int floor;

    @Column(nullable = false)
    private int number;

    @ManyToOne
    @JoinColumn(name = "hotel_id", nullable = false)
    @JsonBackReference("hotelRoomBackRerefence")
    private Hotel hotel;

    @OneToMany(mappedBy = "room")
    @JsonManagedReference("roomBookingsRoomBackReference")
    private List<Roombooking> roombookings = new ArrayList<>();

    @Column(nullable = false)
    private int price;

    @Column(nullable = false)
    private int max_occupancy;

    @Column(nullable = true)
    private Integer cost_extra_bed;

    @Column(nullable = true)
    private Integer cost_half_board;

    @Column(nullable = true)
    private Integer cost_full_board;

    @Column(nullable = true)
    private Integer cost_all_inclusive;

    @OneToMany(mappedBy = "room")
    @JsonManagedReference("imageRoomBackReference")
    private Set<Image> images;

    public long getId() {
        return id;
    }

    public RoomType getType() {
        return type;
    }

    public int getFloor() {
        return floor;
    }

    public int getNumber() {
        return number;
    }

    public String getHotel() {
        return hotel.getName();
    }

    public int getPrice() {
        return price;
    }

    public int getMax_occupancy() {
        return max_occupancy;
    }

    public Integer getCost_extra_bed() {
        return cost_extra_bed;
    }

    public Integer getCost_half_board() {
        return cost_half_board;
    }

    public Integer getCost_full_board() {
        return cost_full_board;
    }

    public Integer getCost_all_inclusive() {
        return cost_all_inclusive;
    }

    public Set<Image> getImages() {
        return images;
    }

    // TODO: 2020-04-15 TIll ev admin-UI Sprint 2
//    public Set<Roombooking> getRoombookings() {
//        return roombookings;
//    }

    public boolean isFree(Date start_date, Date end_date) {
        for (int i = 0; i < roombookings.size(); i++) {
            Roombooking rb = roombookings.get(i);
            if (!checkFree(rb, start_date, end_date)) return false;
        }
        return true;
    }

    private boolean checkFree(Roombooking s, Date start_date, Date end_date) {
        return  ((s.getBooking().getEnd_date()).before(start_date) || s.getBooking().getEnd_date().equals(start_date) ||
                (end_date.before(s.getBooking().getStart_date()) || end_date.equals(s.getBooking().getStart_date())));
    }

    public void setType(RoomType type) {
        this.type = type;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setMax_occupancy(int max_occupancy) {
        this.max_occupancy = max_occupancy;
    }

    public void setCost_extra_bed(Integer cost_extra_bed) {
        this.cost_extra_bed = cost_extra_bed;
    }

    public void setCost_half_board(Integer cost_half_board) {
        this.cost_half_board = cost_half_board;
    }

    public void setCost_full_board(Integer cost_full_board) {
        this.cost_full_board = cost_full_board;
    }

    public void setCost_all_inclusive(Integer cost_all_inclusive) {
        this.cost_all_inclusive = cost_all_inclusive;
    }
}
