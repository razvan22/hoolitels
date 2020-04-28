<template>
<body>
      <DisplayHotel v-for="h in city.hotels" :key="h.id" :hotel="h" :DisplayRooms="false"/>
</body>
</template>

<script>


import DisplayHotel from "@/components/DisplayHotel.vue";


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
    DisplayHotel 
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
