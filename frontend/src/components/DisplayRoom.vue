<template>
  <div class="container hotel-from-search">
    <div class="row">
      <div class="col s12 m12 l12">
        <div class="card hoverable">
          <div class="card-image">
            <img
              src="https://static.thatsup.co/content/img/article/15/jul/guiden-till-prisvarda-hotell-i-stockholm.jpg"
            />
            <span class="card-title">{{ hotel.name }}</span>   
          </div>
          <div class="card-content">
            <div class="row">
              <ul class="amenities">
                 <h5> Bekvämligheter</h5>
                <li v-for="a in hotel.amenities" :key="a.id">
                  <div class="valign-wrapper">
                    <i class="material-icons teal-text">check_circle</i
                    >{{ a.name }}
                  </div>
                </li>
              </ul>
            </div>
            <div class="row">
                <div class="col s12">
                    <h5>Betyg</h5>
                    <h5>8/10</h5>
                </div>
            </div>
            <div class="row">
              <div class="col s12">
                   <h5> Tillgängliga rum</h5>
                <RoomView v-for="r in hotel.rooms" :key="r.id" :room="r"/>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import RoomView from "@/components/RoomView.vue";

export default {
  name: "DisplayHotelFromSearch",
  props: [`hotel`],
  data() {
    return {
    
    };
  },
  mounted() {},
  components: {
    RoomView,
  },
};
</script>

<style>
.amenities {
  font-size: smaller;
}
</style>