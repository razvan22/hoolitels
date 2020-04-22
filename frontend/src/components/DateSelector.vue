<template>
  <div class="container">  
    <div class="row">
      <div class="input-field col s12 m12 l12">
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
      <div class="input-field col s12 m12 l12">
        <select v-model="booking.rooms">
          <option v-for="n in 5" :key="n" :value="n" selected
            >{{ n }} rum</option
          >
        </select>
      </div>
    </div>
    <HotelDatePicker
      :showYear="true"
      :displayClearButton="false"
      :firstDayOfWeek="1"
    />
    <div class="center-align">
      <router-link
        to="/result"
        class="search-btn waves-effect waves-light btn cyan darken-2"
        >Sök
        <i class="material-icons right">search</i>
      </router-link>
    </div>
  </div>
</template>

<script>
  import M from 'materialize-css'
  import HotelDatePicker from 'vue-hotel-datepicker'

  export default {
    components: {
      HotelDatePicker,
    },
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
      var elems = document.querySelectorAll('select')
      M.FormSelect.init(elems)
    },
    updated() {
      var elems = document.querySelectorAll('select')
      M.FormSelect.init(elems)
    },
    methods: {
      getTomorrow() {
        let d = new Date()
        d.setDate(d.getDate() + 4)
        return d
      },
    },
  }
</script>

<style>


  .input-field {
    background: rgb(255, 255, 255);
    
  }
  .myicon {
    font-size: 3rem !important;
  }

  .card {
    margin: 20px;
    padding: 10px;
    background: rgb(255, 255, 255, 1);
  }

  .search-btn {
    margin-top: 3%;
    width: 30%;
     border-radius: 25px;
  }
</style>
