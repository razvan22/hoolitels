<template>
  <body>
    <div>
      <h1>Sökparametrar</h1>
      <span>{{ this.$store.state.resultSortFilter.selected }}</span>
      <span>,{{ this.$store.state.resultSortFilter.checkedFiltration }}</span>
      <span>,{{ this.$store.state.resultSortFilter.dist_to_beach }}</span>
      <span>,{{ this.$store.state.resultSortFilter.dist_to_town }}</span>
    </div>
    <SortAndFilter />
    <div :key="newHotels">
      <DisplayHotel
        v-for="h in hotels"
        :key="h.id"
        :hotel="h"
        :DisplayRooms="false"
      />
    </div>
  </body>
</template>

<script>
import DisplayHotel from "@/components/DisplayHotel.vue";
import SortAndFilter from "@/components/SortAndFilter.vue";
import { bus } from "../main";

export default {
  data() {
    return {
      city: {},
      newHotels: 0,
      hotels: [],
    };
  },

  created() {
    bus.$on("changeIt", (data) => {
      console.log("We got some new data from the filter!!!", data);
      this.getCity();
      if (this.$store.state.resultSortFilter.dist_to_beach) {
        console.log("distans strand", this.city.hotels.length);
        this.hotels = this.city.hotels.filter(
          (h) =>
            h.distance_to_beach <=
            this.$store.state.resultSortFilter.dist_to_beach
        );
        console.log("after filter", this.hotels.length);
        this.newHotels += 1;
      }
    });
  },

  mounted() {
    this.getCity();
  },

  components: {
    DisplayHotel,
    SortAndFilter,
  },

  methods: {
    getCity: async function() {
      let searchObj = {
        city_id: this.$store.state.dateSelected.selectedCity,
        start_date: this.$store.state.booking.check_in,
        end_date: this.$store.state.booking.check_out,
        nr_of_rooms: this.$store.state.booking.rooms,
      };

      let response = await fetch(
        "/rest/city/" + this.$store.state.dateSelected.selectedCity
      );
      console.log("searchObj: ", searchObj, " ", JSON.stringify(searchObj));

      // let response = await fetch("/rest/search/", {
      //   "method": "GET",
      //   "headers": {
      //     "Content-Type": "application/json",
      //   },
      //   "body": JSON.stringify(searchObj),
      // });

      response = await response.json();
      console.log(response);

      this.city = response;
      this.hotels = this.city.hotels;
    },
  },
};
</script>

<style></style>
