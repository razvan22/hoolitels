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
                <h4> Bekvämligheter</h4>
                <li v-for="a in hotel.amenities" :key="a.id">
                  <div class="valign-wrapper">
                    <i class="material-icons teal-text">check_circle</i
                    >{{ a.name }}
                  </div>
                </li>
              </ul>
            </div>
          </div>
          <div class="card-action align-center">
            <router-link :to="{ name: 'HotelVy', params: {id: this.hotel.id}}">Välj</router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>


export default {

 
  name: "DisplayHotelFromSearch",
  props: [`hotel`],
  data() {
    return {};
  },
  mounted() {},
  components: {
 

  },
  methods(){

  }
};
</script>

<style>
.amenities {
  font-size: smaller;
}
</style>
