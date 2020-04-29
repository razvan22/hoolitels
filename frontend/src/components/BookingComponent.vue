<template>
  <div id="booking">
    <div>
      <div id="row" class="row" v-for="booking in bookings" :key="booking.id">
        <div class="col s12 m3 l3">
          <h6 class="center">Bokningsperiod</h6>
          <p class="center">
            {{ booking.start_date }} - {{ booking.end_date }}
          </p>
        </div>
        <div class="col s12 m3 l3">
          <h6 class="center">Vuxna</h6>
          <p class="center">{{ booking.num_adults }}</p>
        </div>
        <div class="col s12 m3 l3">
          <h6 class="center">Barn</h6>
          <p class="center">{{ booking.num_children }}</p>
        </div>
        <div class="col s12 m3 l3">
          <h6 class="center">Spädbarn</h6>
          <p class="center">{{ booking.num_infants }}</p>
        </div>
        <div
          class="col s12 m12 l12 "
          v-for="room in booking.roombookings"
          :key="room.id"
        >
          <div class="row">
            <div class="col s12 m3">
              <h6 class="center">rumsnummer</h6>
              <p class="center">{{ room.room_id }}</p>
            </div>
            <div class="col s12 m3">
              <h6 class="center">rumspris</h6>
              <p class="center">{{ room.room_cost }}</p>
            </div>
            <div class="col s12 m3">
              <h6 class="center">extra sängkostnad</h6>
              <p class="center">{{ room.extra_bed }}</p>
            </div>
            <div class="col s12 m3">
              <h6 class="center">matkostnad</h6>
              <p class="center">{{ room.food_cost }}</p>
            </div>
            <div class="col s12 m3">
              <h6 class="center">Lämna ett omdöme</h6>
              <p>link</p>             
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'BookingComponent',

    data() {
      return {
        bookings: this.$store.state.user.bookings,
      }
    },
    mounted() {
      console.log(this.bookings)
    },
  }
</script>

<style scoped>
  #booking #row {
    border-radius: 1em;
    border: solid #e0e0e0;
  }
  #booking .row {
    margin: 2vh 0vw 2vh 0vw;
  }</style
>>
