<template>
  <div id="app" class="back">
    <div id="filter">
      <div class="all">
        <Header />
        <main>
          <router-view />
        </main>
      </div>
    </div>
    <Footer />
  </div>
</template>
<script>
import Header from "@/components/Header.vue";
import Footer from "@/components/Footer.vue";

export default {
  components: {
    Header,
    Footer,
  },
  created() {
    this.$store.dispatch("getCities"),
    this.$store.dispatch("getAmenities");
    this.$store.dispatch("isUserLogged");
    this.$store.dispatch("getCountries");
  },
};
</script>

<style src="materialize-css/dist/css/materialize.css"></style>
<style scoped>
#app {
  /* flex: 1 0 auto; */
}

.back {
  flex-direction: column;
  display: flex;
  background-image: url("../src/assets/header-img.jpg") !important;
  background-size: cover !important;
  background-repeat: no-repeat !important;
  background-attachment: fixed !important;
  padding: 0;
  background: linear-gradient(
    to bottom,
    rgb(121, 193, 204),
    rgb(253, 221, 155)
  );
}
#filter {
  background: rgb(236, 236, 236, 0.3);
}

.all {
  min-height: calc(100vh - 55px) !important;
  flex: 1 0 auto;
}
</style>
