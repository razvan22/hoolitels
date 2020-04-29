<template>
  <div>
    <div class="container">
      <div class="container">
        <h4 class="headline">Hitta tusentals hotell över hela Sverige</h4>
      </div>
      <div class="row selectors">
        <div class="input-field col s12 m6">
          <span class="col s1 m1 icon_in">
            <i class="fas fa-map-marker-alt"></i>
          </span>
          <div class="col s11 m11">
            <select v-model="selectedCity">
              <option value disabled selected>Välj stad</option>
              <option
                v-for="city in $store.state.cities"
                :key="city.id"
                :value="city.id"
                >{{ city.name }}</option
              >
            </select>
          </div>
        </div>
        <div class="input-field col s12 m6">
          <span class="col s1 icon_in">
            <i class="fas fa-home"></i>
          </span>
          <div class="col s11">
            <select v-model="selectedRooms">
              <option v-for="n in 5" :key="n" :value="n" selected
                >{{ n }} rum</option
              >
            </select>
          </div>
        </div>
      </div>
      <HotelDatePicker
        @checkInChanged="this.updateCheckIn"
        @checkOutChanged="updateCheckOut"
        :showYear="true"
        :displayClearButton="false"
        :firstDayOfWeek="1"
        :startingDateValue="new Date()"
        :endingDateValue="getTomorrow()"
      />
      <div class="center-align">
        <router-link
          to="/result"
          :disabled="!selectedCity"
          class="search-btn waves-effect waves-light btn cyan darken-2"
          >Sök</router-link
        >
      </div>
    </div>
  </div>
</template>

<script>
import M from "materialize-css";
import HotelDatePicker from "vue-hotel-datepicker";

export default {
  components: {
    HotelDatePicker,
  },
  computed: {
    selectedRooms: {
      get() {
        return this.$store.state.booking.rooms;
      },

      set(value) {
        this.$store.commit("setSelectedRooms", value);
      },
    },

    selectedCity: {
      get() {
        return this.$store.state.dateSelected.selectedCity;
      },
      set(value) {
        this.$store.commit("setSelectedCity", value);
      },
    },

    startdate: {
      get() {
        return this.$store.state.booking.check_in;
      },

      set(value) {
        this.$store.commit("setCheckIn", value);
      },
    },

    enddate: {
      get() {
        return this.$store.state.booking.check_out;
      },

      set(value) {
        this.$store.commit("setCheckOut", value);
      },
    },
  },

  data() {
    return {
      booking: {
        rooms: 1,
        check_in: "",
        check_out: "",
      },
    };
  },
  mounted() {
    var elems = document.querySelectorAll("select");
    M.FormSelect.init(elems);
    this.startdate = new Date();
    this.enddate = this.getTomorrow();
  },

  updated() {
    var elems = document.querySelectorAll("select");
    M.FormSelect.init(elems);
  },

  methods: {
    updateCheckIn(date) {
      this.$store.commit("setCheckIn", date);
      console.log("updateCheckin: ", date);

      // this.startdate = date;
    },

    updateCheckOut(date) {
      this.$store.commit("setCheckOut", date);
      console.log("updateCheckOut: ", date);
      // this.enddate = date;
    },

    getTomorrow() {
      let d = new Date();
      d.setDate(d.getDate() + 2);
      return d;
    },
  },
};
</script>

<style>
.select-wrapper input.select-dropdown {
  border-bottom: none !important;
}
</style>

<style scoped>
.selectors {
  margin-bottom: 14px;
}

.headline {
  color: rgb(253, 253, 253);
  margin: 20px;
}

.icon_in {
  margin-top: 10px;
  font-size: 18px;
  color: Turquoise;
  padding-left: 5px;
}

.datepicker__wrapper {
  height: 50px !important;
}

.datepicker__wrapper >>> .datepicker__dummy-wrapper {
  border: none !important;
}

.input-field {
  background: rgb(255, 255, 255);
}
.myicon {
  font-size: 3rem !important;
}

.search-btn {
  margin-top: 40px;
  width: 30%;
  border-radius: 25px;
}
</style>
