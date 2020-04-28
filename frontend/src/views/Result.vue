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
    <DisplayHotel
      v-for="h in city.hotels"
      :key="h.id"
      :hotel="h"
      :DisplayRooms="false"
    />
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
    };
  },

  created() {
    bus.$on("changeIt", (data) => {
      console.log("We got some new data from the filter!!!", data);
      this.getCity();
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
    },
  },
};
</script>

<style></style>
