<template>
  <div class="row">
    <div class="col m3"></div>
    <div class="col s12 m6">
      <div class="card hoverable">
        <div class="card-image">
          <img :src="require('@/assets/' + hotel.images[0].url)" />
          <span class="card-title">{{ hotel.name }}</span>
        </div>
        <div class="card-content">
          <div class="row">
            <div class="contact col s5 m4 l3">
              <h4>Omdöme</h4>
              <div>
                <star-rating :inline="true" :star-size="24" :increment="0.5" :read-only="true" :show-rating="false" :rating="(hotel.grade/2)"></star-rating>

              </div>
            </div>
            <div class="col s5 m4 l3 ">
              <ul class="amenities">
                <h4 v-if="amenitiesIsEmpty">Bekvämligheter</h4>
                <li v-for="a in hotel.amenities" :key="a.id">
                  <div class="valign-wrapper">
                    <i class="material-icons teal-text">check_circle</i
                    >{{ a.name }}
                  </div>
                </li>
              </ul>
            </div>
          </div>
          <div class="row">
            <div class="col distance">
              <h4>Avstånd</h4>
              <ul>
                <li class="valign-wrapper">
                  <i class="material-icons tiny">location_city</i>
                  {{ hotel.distance_to_town_center }} meter till centrum
                </li>
                <li class="valign-wrapper">
                  <i class="material-icons tiny">beach_access</i>
                  {{ hotel.distance_to_beach }} meter till stranden
                </li>
              </ul>
            </div>
            <div class="contact col">
              <h4>Kontakt</h4>
              <ul>
                <li class="valign-wrapper">
                  <i class="material-icons tiny"> email</i>
                  {{ hotel.email }}
                </li>
                <li class="valign-wrapper">
                  <i class="material-icons tiny"> contact_phone</i>
                  {{ hotel.phone }}
                </li>
              </ul>
            </div>
          </div>
          <div v-if="DisplayRooms">
            <RoomTypeList
              :rooms="hotel.rooms"
              :ref="'roomTypeList' + hotel.id"
            />
          </div>
        </div>
        <div class="card-action align-center" v-if="!DisplayRooms">
          <router-link :to="{ name: 'HotelVy', params: { hotel: this.hotel } }"
            >Boka rum på detta hotell</router-link
          >
        </div>
        <div v-else class="card-action align-center">
          <router-link
            :to="{ name: 'Order' }"
            :disabled="buttonShouldBeDisabled"
            >Boka rum! ({{ this.totRoomsSelected }} av
            {{ this.numRoomsToBook }} bokade)</router-link
          >
        </div>
      </div>
    </div>
    <div class="col m3"></div>
  </div>
  
</template>

<script>
  import RoomTypeList from '@/components/RoomTypeList'
  import StarRating from "vue-star-rating";

export default {
    name: 'DisplayHotel',
    props: [`hotel`, `DisplayRooms`],
    data() {
      return {
        isHidden: false,
      }
    },
    computed: {
      numRoomsToBook() {
        return this.$store.state.booking.rooms
      },
      totRoomsSelected() {
        return this.$store.state.roomSelection.totSelectedRooms
      },

      buttonShouldBeDisabled() {
        return this.totRoomsSelected < this.numRoomsToBook
      },

      amenitiesIsEmpty() {
        return this.hotel.amenities && this.hotel.amenities.length
      },
    },

    components: {
      RoomTypeList,
      StarRating
    },
}
</script>

<style scoped>
  /* ändra h4 till en klass */
  h4 {
    margin-top: 10px;
  }

  .row {
    margin-bottom: 0px;
  }
  .rating__icon--star {
    color: orange;
    font-size: 18px;
  }

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
  .card-title {
    text-shadow: 1px 1px black !important;
    background: rgba(253, 253, 253, 0.3);
    width: 100%;
    padding: 10px 15px !important;
  }
  .card-image img {
    /* opacity: 0.8; */
  }
</style>
