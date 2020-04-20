<template>
  <div class="result">
      <Logo />
      <DisplayRoom v-for="h in city.hotels" :key="h.id" :hotel="h" />
      <Footer />
    </div>
</template>

<script>
import Logo from "@/components/Header.vue";
// import Logo from '@/components/Logo.vue'
import DisplayRoom from "@/components/DisplayRoom.vue";
import Footer from "@/components/Footer.vue";

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
    Logo,
    Footer,
    DisplayRoom,
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