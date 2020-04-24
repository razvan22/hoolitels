<template>
  <div class="result"> 
      <DisplayHotel :hotel="this.$route.params.hotel" :DisplayRooms="true" /> 
    </div>
</template>

<script>
import DisplayHotel from "@/components/DisplayHotel.vue";

export default {
  components: {   
    DisplayHotel
  }
};
</script>