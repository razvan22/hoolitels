<template>
<body>
    <Header/>
    <main>

        <SideNavAmenities/>
      <DisplayHotelFromSearch v-for="h in city.hotels" :key="h.id" :hotel="h" />

      </main>
      <Footer />
</body>
</template>

<script>

// import Logo from '@/components/Logo.vue'
import DisplayHotelFromSearch from "@/components/DisplayHotelFromSearch.vue";
import Footer from "@/components/Footer.vue";
import SideNavAmenities from "@/components/SideNavAmenities.vue";
import Header from "@/components/Header.vue";


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
    Footer,
    DisplayHotelFromSearch,
    SideNavAmenities,
    Header,
 
  },
  methods: {
    getCity: async function() {
      let response = await fetch(
        "http://localhost:8070/rest/city/" +
          this.$store.state.dateSelected.selectedCity
      );
      response = await response.json();
      this.city = response;
      console.log(this.city);
    },
  },
};
</script>

<style></style>
