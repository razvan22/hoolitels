<template>
  <div class="date_selector container">
    <div class="row" id="date-city-selector">
      <div class="input-field col s12 m6 l6">
        <select v-model="selectedCity" id="citySelected">
          <option value disabled selected>välj stad</option>
          <option v-for="city in $store.state.cities" :key="city.id" :value="city.id">{{city.name}}</option>
        </select>
      </div>
      <div class="input-field col s6 m3 l3">
        <input id="from" type="text" class="datepicker" v-model="booking.check_in" />
        <label for="from">Check-in Date</label>
      </div>
      <div class="input-field col s6 m3 l3">
        <input id="to" type="text" class="datepicker" v-model="booking.check_out" />
        <label for="to">Check-out Date</label>
      </div>
      <ul>
        <li v-for="city in $store.state.cities" :key="city.id">{{ city.name }}</li>
      </ul>
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
      cities3() {
        return this.$store.state.cities;
      }
    }
  },

  data() {
    return {
      selected: {
        id: 0,
        name: "Välj"
      },
      cities2: [
        {
          id: 1,
          name: "Lund"
        },
        {
          id: 2,
          name: "Malmö"
        }
      ],
      booking: {
        city: "",
        check_in: "",
        check_out: ""
      },
      cities: []
    };
  },
  mounted() {
    var elems = document.querySelectorAll("select");
    M.FormSelect.init(elems);
    elems = document.querySelectorAll(".datepicker");
    M.Datepicker.init(elems);
    this.getCity();
  },
  methods: {
    getCity: async function() {
      let response = await fetch("http://localhost:8070/rest/city");
      response = await response.json();
      this.cities = response;
      console.log(this.cities);
    }
  }
};
</script>

<style>
/* #date-city-selector{
    margin-top: 1em;
    border: solid 1px #e0e0e0 ;
    border-radius: 0.30em;
} */
</style>