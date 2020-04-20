<template>
  <body>
    <Header />
    <main>
      <SearchHotel />
    </main>
    <Footer />
  </body>
</template>

<script>
import Header from "@/components/Header.vue";
import Footer from "@/components/Footer.vue";
import SearchHotel from "@/components/SearchHotel.vue";

export default {
  name: "Home",
  components: {
    Header,
    SearchHotel,
    Footer,
  },
};
</script>

<style>
</style>
