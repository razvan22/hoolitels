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
      if(this.$store.state.resultSortFilter.dist_to_beach){
        console.log("distans strand", this.city.hotels.length)
        this.hotels = this.city.hotels.filter(h=> h.distance_to_beach <= this.$store.state.resultSortFilter.dist_to_beach)
        console.log("after filter", this.hotels.length)
        this.newHotels +=1;
       
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
      let response = await fetch(
        "/rest/city/" + this.$store.state.dateSelected.selectedCity
      );
      response = await response.json();
      this.city = response;
      this.hotels = this.city.hotels;
    },
  },
};
</script>

<style></style>
