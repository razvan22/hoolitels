package com.hoolitels.server.rest;

import java.util.Date;
import java.util.List;

public class SearchModel {

    private Long city_id;

    private Integer distance_to_beach;

    private Integer distance_to_town_center;

    private Integer nr_rooms;

    private List<Long> amenities;

    private Date start_date;

    private Date end_date;

    public Long getCity_id() {
        return city_id;
    }

    public void setCity_id(Long city_id) {
        this.city_id = city_id;
    }

    public Integer getDistance_to_beach() {
        return distance_to_beach;
    }

    public void setDistance_to_beach(Integer distance_to_beach) {
        this.distance_to_beach = distance_to_beach;
    }

    public Integer getDistance_to_town_center() {
        return distance_to_town_center;
    }

    public void setDistance_to_town_center(Integer distance_to_town_center) {
        this.distance_to_town_center = distance_to_town_center;
    }

    public Integer getNr_rooms() {
        return nr_rooms;
    }

    public void setNr_rooms(Integer nr_rooms) {
        this.nr_rooms = nr_rooms;
    }

    public List<Long> getAmenities() {
        return amenities;
    }

    public void setAmenities(List<Long> amenities) {
        this.amenities = amenities;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }
}
