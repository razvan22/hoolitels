<template>
  <div id="app" class="back">
    <div id="fade">
      <router-view />
    </div>
  </div>
</template>
<script>
  export default {
    created() {
      this.$store.dispatch('getCities'),
      this.$store.dispatch('getAmenities')
    },
  }
</script>

<style src="materialize-css/dist/css/materialize.css"></style>
<style>
  
  body {
    display: flex;
    min-height: 100vh;
    flex-direction: column;
  }

  #app {
    flex: 1 0 auto;
  }
  .back {
    background-image: url("../src/assets/header-img.jpg");
    background-size: cover;
  }
  #fade {
    background: rgb(236, 236, 236, 0.3);
  }
</style>
