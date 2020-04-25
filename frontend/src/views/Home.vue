<template>
<body>
  <FirstSearch />
</body>
</template>

<script>
import FirstSearch from "@/components/FirstSearch.vue";

export default {
  name: "Home",
  components: {
    FirstSearch
  }
};
</script>

<style scoped>
body {
  /* background-image: url("@/../../assets/header-img.jpg") !important; */
}
</style>
