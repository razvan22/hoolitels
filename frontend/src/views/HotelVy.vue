<template>
  <div class="result">
      <Logo />
      <DisplayHotel :hotel="this.$route.params.hotel" :DisplayRooms="true" /> 
      <Footer />
    </div>
</template>

<script>
import Logo from "@/components/Header.vue";
import DisplayHotel from "@/components/DisplayHotel.vue";
import Footer from "@/components/Footer.vue";

export default {
  data() {
    return {
    
    };
  },

  mounted() {
   
  },

  components: {
    Logo,
    Footer,
    DisplayHotel,
  },
  methods: {
   
}
};
</script>

<style></style>