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

    <vc-date-picker
      mode="range"
      v-model="range"
      color="teal"
      :min-date="new Date()"
      :columns="$screens({ default: 1, md: 2 })"
      :is-expanded="$screens({ default: true, md: false })"
      :input-props="{
        class:
          'w-full shadow appearance-none border rounded py-2 px-3 text-gray-700 hover:border-blue-5',
        placeholder: 'Please enter your birthday',
        readonly: true,
      }"
    >
    </vc-date-picker>
  </div>
</template>

<script>
  import M from 'materialize-css'
  import Vue from 'vue'
  import VCalendar from 'v-calendar'
  Vue.use(VCalendar, {
    componentPrefix: 'vc',
  })
  export default {
    computed: {
      selectedCity: {
        get() {
          return this.$store.state.dateSelected.selectedCity
        },
        set(value) {
          this.$store.commit('setSelectedCity', value)
        },
      },
    },

    data() {
      return {
        range: {
          start: new Date(), // Jan 16th, 2018
          end: this.getTomorrow(),
        },
        selectedDate: new Date(2018, 0, 10),
        selected: {
          id: 0,
          name: 'Välj',
        },

        booking: {
          rooms: 1,
          check_in: '',
          check_out: '',
        },
      }
    },
    mounted() {
      var elems = document.querySelectorAll('.datepicker')
      M.Datepicker.init(elems)
      elems = document.querySelectorAll('select')
      M.FormSelect.init(elems)
    },
    updated() {
      var elems = document.querySelectorAll('select')
      M.FormSelect.init(elems)
    },
    methods: {
      getTomorrow() {
        let d = new Date()
        d.setDate(d.getDate() + 1)
        return d
      },
    },
  }
</script>

<style>
  .myicon {
    font-size: 3rem !important;
  }
  /* #date-city-selector{
    margin-top: 1em;
    border: solid 1px #e0e0e0 ;
    border-radius: 0.30em;
} */
</style>
