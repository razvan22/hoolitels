<template>
  <div id="app">
    <router-view />
  </div>
</template>
<script>
export default { 
  created() {
    this.$store.dispatch("getCities");
  }
};
</script>



<style src="materialize-css/dist/css/materialize.css"></style>

