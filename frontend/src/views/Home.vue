<template>
  <body>
    <Header />
    <section class="main">
      <SearchHotel />
    </section>
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
.row-1 {
  display: flex;
  justify-content: end;
}
header .container {
  border-radius: 0.3em;
  /* margin-top: 1em;  */
  /* height: 20em; */
  background: url("../assets/header-img.jpg");
  background-size: cover;
  background-position: center;
}

header .row .col.m12 {
  margin-top: 2em;
  display: flex;
  justify-content: space-around;
}

header .container .row-1 .col-login {
  margin-left: 0em;
  margin-right: 0em;
  padding: 0em;
  margin-top: 1em;
}

header .container .row-1 .sign_up {
  margin-left: 0em;
  margin-right: 0em;
  padding: 0em;
  margin-top: 1em;
}
.row .sign_up i {
  font-size: 2em;
}
.row .col-login i {
  font-size: 2em;
}

.responsive {
  width: 100%;
  max-width: 20em;
  height: auto;
}
</style>
