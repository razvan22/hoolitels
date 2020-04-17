<template>
  <div class="date_selector container">
    <div class="row" id="date-city-selector">
      <div class="input-field col s12 m6">
        <select v-model="selectedCity">
          <option value="" disabled selected>Välj stad</option>
          <option
            v-for="city in $store.state.cities"
            :key="city.id"
            :value="city.id"
            >{{ city.name }}</option
          >
        </select>
      </div>
      <div class="input-field col s12 m6">
        <select v-model="booking.rooms">
          <option v-for="n in 10" :key="n" :value="n" selected
            >{{ n }} rum</option
          >
        </select>
      </div>
    </div>

    <div class="row" id="date-city-selector">
      <div class="input-field col s6">
        <input
          id="from"
          type="text"
          class="datepicker"
          v-model="booking.check_in"
        />
        <label for="from">Check-in date</label>
      </div>
      <div class="input-field col s6">
        <input
          id="to"
          type="text"
          class="datepicker"
          v-model="booking.check_out"
        />
        <label for="to">Check-out date</label>
      </div>
    </div>
    <div class="s12 center-align">
      <router-link
        to="/result"
        class="waves-effect waves-light btn-small cyan darken-2"
        >Sök
        <i class="material-icons right">search</i>
      </router-link>
    </div>
  </div>
</template>

<script>
import M from "materialize-css";
export default {
  computed: {
    selectedCity: {
      get() {
        return this.$store.state.dateSelected.selectedCity;
      },
      set(value) {
        this.$store.commit("setSelectedCity", value);
      },
    },
  },

  data() {
    return {
      selected: {
        id: 0,
        name: "Välj",
      },

      booking: {
        rooms: 1,
        check_in: "",
        check_out: "",
      },
    };
  },
  mounted() {
    var elems = document.querySelectorAll(".datepicker");
    M.Datepicker.init(elems);
    elems = document.querySelectorAll("select");
    M.FormSelect.init(elems);
  },
  updated() {
    var elems = document.querySelectorAll("select");
    M.FormSelect.init(elems);
  },
};
</script>

<style>
/* #date-city-selector{
    margin-top: 1em;
    border: solid 1px #e0e0e0 ;
    border-radius: 0.30em;
} */
</style>
