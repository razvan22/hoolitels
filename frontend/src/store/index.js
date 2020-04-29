import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    cities: [],
    amenities: [],
    dateSelected: {
      selectedCity: 0,
    },
    city: {},
    hotels: [],
    user: {},
    userLogged: false,

    resultSortFilter: {
      selected: "price-low-hi",
      checkedFiltration: [],
      distance_to_beach: 0,
      distance_to_town: 0,
    },

    booking: {
      rooms: 1,
      check_in: "",
      check_out: "",
    },

    countries: [],
    originalHotels: [],
    roomSelection: {
      selectedRoomsPerType: [0, 0, 0, 0],
      roomIdPerType: [[],[],[],[]],
      totSelectedRooms: 0,
    },  
  },

  mutations: {
    setSelectedRoomsPerType(state, value) {
      state.roomSelection.selectedRoomsPerType[value.list] = parseInt(value.newVal);

      let sum = 0;
      for (let i = 0; i <state.roomSelection.selectedRoomsPerType.length; i++) {
        sum += state.roomSelection.selectedRoomsPerType[i];
      }
      state.roomSelection.totSelectedRooms = sum;
    },

    setSelectedRoomsIdsPerType(state, listNum, value) {
      state.roomSelection.roomIdPerType[listNum] = value;
    }, 

    setSortFilter(state, value) {
      state.resultSortFilter = value;
    },

    setSelectedCity(state, value) {
      state.dateSelected.selectedCity = value;
    },

    setCities(state, value) {
      state.cities = value;
    },

    setAmenities(state, value) {
      state.amenities = value;
    },

    setUser(state, value) {
      state.user = value;
    },

    userLogStatus(state, value) {
      state.userLogged = value;
    },

    setCountries(state, value) {
      state.countries = value;
    },

    setSelectedRooms(state, value) {
      state.booking.rooms = value;
    },

    setOriginalHotels(state, value) {
      state.originalHotels = value;
    },

    setCheckIn(state, value) {
      state.booking.check_in = value;
    },

    setCheckOut(state, value) {
      state.booking.check_out = value;
    },

    setCity(state, value) {
      state.city = value;
    },

    setHotels(state, value) {
      state.hotels = value;
    },

    filterHotels(state) {
      // Use state.resultSortFilter to create a filtered list
      if (state.resultSortFilter.dist_to_beach) {
        state.hotels = state.city.hotels.filter(
          (h) => h.distance_to_beach <= state.resultSortFilter.dist_to_beach
        );
      }
    },
  },

  actions: {
    async getCities({ commit }) {
      let response = await fetch("rest/city");
      response = await response.json();
      commit("setCities", response);
    },

    async springLogin({ commit }, credent) {
      let credentials =
        "username=" +
        encodeURIComponent(credent.email) +
        "&password=" +
        encodeURIComponent(credent.password);

      let response = await fetch("/login", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: credentials,
        redirect: "manual",
      });

      if (response.url.includes("error")) {
        console.log("Wrong username/password");
      } else {
        response = await fetch("api/whoami");
        let responsee = await response.json();
        commit("setUser", responsee);
        this.state.userLogged = true;
      }
    },

    async isUserLogged({ commit }) {
      let response = await fetch("api/whoami");
      let responsee = await response.json();

      if (responsee == null) {
        this.state.userLogged = false;
      } else {
        this.state.userLogged = true;
      }
      commit("setUser", responsee);
    },

    async getAmenities({ commit }) {
      let response = await fetch("/rest/amenity");
      response = await response.json();
      commit("setAmenities", response);
    },

    async logout({ commit }) {
      await fetch("http://localhost:8070/logout", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
      });
      document.cookie =
        "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
      this.state.userLogged = false;
      commit("setUser", null);
    },

    async getCountries({ commit }) {
      let response = await fetch("http://localhost:8070/rest/country");
      response = await response.json();
      commit("setCountries", response);
    },

    async getCity({ commit, state }) {
      let searchObj = {
        city_id: state.dateSelected.selectedCity,
        start_date: state.booking.check_in,
        end_date: state.booking.check_out,
        nr_of_rooms: state.booking.rooms,
      };   

      let response = await fetch('/rest/search/', {
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(searchObj),
      })

      response = await response.json();
      console.log(response);

      commit("setOriginalHotels", response);
      commit("setHotels", response);
    },
  },

  modules: {},
});
