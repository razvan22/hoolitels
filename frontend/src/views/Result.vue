<template>
  <body>
    <SortAndFilter />
    <h5 v-if="hotels.length == 0" class="center-align">Det finns inga hotell som matchar ditt sökfilter</h5>
    <DisplayHotel
      v-for="h in hotels"
      :key="h.id"
      :hotel="h"
      :DisplayRooms="false"
    />
  </body>
</template>

<script>
import DisplayHotel from "@/components/DisplayHotel.vue";
import SortAndFilter from "@/components/SortAndFilter.vue";

export default {
  computed: {
    hotels() {
      return this.$store.state.hotels;
    },
  },

  created() {
    this.$store.dispatch("getCity");
  },

  components: {
    DisplayHotel,
    SortAndFilter,
  },
};
</script>
