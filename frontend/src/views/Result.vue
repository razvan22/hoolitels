<template>
<body>
      <SortAndFilter/>
      <DisplayHotel v-for="h in city.hotels" :key="h.id" :hotel="h" :DisplayRooms="false"/>
</body>
</template>

<script>

// import Logo from '@/components/Logo.vue'
import DisplayHotel from "@/components/DisplayHotel.vue";
import SortAndFilter from "@/components/SortAndFilter.vue";


export default {
  data() {
    return {
      city: {},
    };
  },

  mounted() {
    this.getCity();
  },

  components: {
    DisplayHotel,
    SortAndFilter 
  },
  methods: {
    getCity: async function() {
      let response = await fetch(
        "/rest/city/" +
          this.$store.state.dateSelected.selectedCity
      );
      response = await response.json();
      this.city = response;
    },
  },
};
</script>

<style></style>
