<template>
  <div class="container hotel-from-search">
    <div class="row">
      <div class="col s12 m12 l12">
        <div class="card hoverable">
          <div class="card-image">
            <img :src="require('@/assets/' + hotel.images[0].url)" />
            <span class="card-title">{{ hotel.name }}</span>
          </div>
          <div class="card-content">
            <div class="row">
              <ul class="col l5 amenities">
                <h4 v-if=" !amenitiesIsEmpty">Ej bekvämligheter</h4>
                <h4 v-if="amenitiesIsEmpty">Bekvämligheter</h4>
                <li v-for="a in hotel.amenities" :key="a.id">
                  <div class="valign-wrapper">
                    <i class="material-icons teal-text">check_circle</i>
                    {{ a.name }}
                  </div>
                </li>
              </ul>
              <div class="contact col s2">
                <h4>Betyg</h4>
                <h5>8/10</h5>
              </div>
              <div class="col distance">
                <h4>Avstånd</h4>
                <ul>
                  <li>
                    <i class="material-icons tiny">location_city</i>
                    {{hotel.distance_to_town_center}} meter till centrum
                  </li>
                  <li>
                    <i class="material-icons tiny">beach_access</i>
                    {{hotel.distance_to_beach}} meter till stranden
                  </li>
                </ul>
              </div>
              <div class="contact col">
                <h4>Kontakt</h4>
                <ul>
                  <li>
                    <i class="material-icons tiny">email</i>
                    {{hotel.email}}
                  </li>
                  <li>
                    <i class="material-icons tiny">contact_phone</i>
                    {{hotel.phone}}
                  </li>
                </ul>
              </div>
            </div>
            <div v-if="DisplayRooms">
              <RoomView v-for="r in hotel.rooms" :key="r.id" :room="r" />
            </div>
          </div>
          <div class="card-action align-center">
            <router-link :to="{ name: 'HotelVy', params: {hotel: this.hotel}}">Läs mer</router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import RoomView from "@/components/RoomView.vue";

export default {
  name: "DisplayHotel",
  props: [`hotel`, `DisplayRooms`],
  data() {
    return {
      isHidden: false
    };
  },
  computed: {
    amenitiesIsEmpty() {
      return this.hotel.amenities && this.hotel.amenities.length;
    }
  },
  mounted() {},
  components: {
    RoomView
  },
  methods: {
    clickHotel() {
      this.$store.commit("setSelectedHotel", this.hotel);
      console.log("hotell", this.hotel);
    }
  }
};
</script>

<style>
.amenities {
  font-size: smaller;
}

.amenities h4 {
  font-size: large;
}

.distance {
  font-size: smaller;
}
.distance h4 {
  font-size: large;
}

.contact {
  font-size: smaller;
}

.contact h4 {
  font-size: large;
}
</style>
