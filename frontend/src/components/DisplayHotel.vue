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
              <ul class="col l6 amenities">
                <h4> Bekvämligheter</h4>
                <li v-for="a in hotel.amenities" :key="a.id">
                  <div class="valign-wrapper">
                    <i class="material-icons teal-text">check_circle</i
                    >{{ a.name }}
                  </div>
                </li>
              </ul>
              <div class="col  distance">
                  <h4>Avstånd</h4>
                <ul>
                  <li>{{hotel.distance_to_town_center}} meter till centrum</li>
                  <li>{{hotel.distance_to_beach}} meter till stranden</li>
                </ul>
              </div>
               <div class="contact col">
                 <h4>Kontakt</h4>
                <ul>
                  <li>{{hotel.email}}</li>
                  <li>{{hotel.zip}}</li>
                  <li>{{hotel.phone}}</li>
                </ul>
               </div>
            </div>
            <div v-if="DisplayRooms">
                <RoomView v-for="r in hotel.rooms" :key="r.id" :room="r" />
            </div>
          </div>
          <div class="card-action align-center">
             <router-link :to="{ name: 'HotelVy', params: {hotel: this.hotel}}">Välj</router-link>
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
    return {};
  },
  mounted() {},
  components: {
    RoomView
 

  },
  methods:{
    clickHotel(){
     this.$store.commit('setSelectedHotel', this.hotel)
     console.log("hotell", this.hotel)
    
    }
  }
};
</script>

<style>
.amenities {
  font-size: smaller;
}

.distance{
  font-size:smaller;
}

.contact{
  font-size:smaller;
}
</style>
