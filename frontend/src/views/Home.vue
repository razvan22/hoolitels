<template>
<body>
  <!-- <FirstSearch /> -->
  <Review />
</body>
</template>

<script>
// import FirstSearch from "@/components/FirstSearch.vue";
import Review from "@/components/Review.vue"
export default {
  name: "Home",
  components: {
    // FirstSearch
    Review
  }
};
</script>

<style scoped>
body {
  /* background-image: url("@/../../assets/header-img.jpg") !important; */
}
</style>
