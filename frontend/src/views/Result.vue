<template>
<body>
    <Header/>
    <main>
      <DisplayHotel v-for="h in city.hotels" :key="h.id" :hotel="h" :DisplayRooms="false"/>
      </main>
      <Footer />
</body>
</template>

<script>

// import Logo from '@/components/Logo.vue'
import DisplayHotel from "@/components/DisplayHotel.vue";
import Footer from "@/components/Footer.vue";
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
    DisplayHotel,
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
    },
  },
};
</script>

<style></style>
