<template>
  <body>
    <SortAndFilter />
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
