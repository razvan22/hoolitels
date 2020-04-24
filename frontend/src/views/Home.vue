<template>
  <body>
    <main>
      <SearchHotel />
    </main>
    <Footer />
  </body>
</template>

<script>
import Footer from "@/components/Footer.vue";
import SearchHotel from "@/components/SearchHotel.vue";

export default {
  name: "Home",
  components: {
    SearchHotel,
    Footer,
  },
};
</script>

<style>
</style>
