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

    bookingInfo: {
      numAdults: 0,
      numChildren: 0,
      numToddlers: 0,
      message: "",
    },

    city: {},
    hotels: [],
    user: {},
    userLogged: false,

    resultSortFilter: {
      sortMode: "10",
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
      roomIdPerType: [[], [], [], []],
      totSelectedRooms: 0,
      roomsSelected: [],
    },
  },

  mutations: {
    setMessageToHotel(state, value) {
      state.bookingInfo.message = value;
    },

    setNumAdults(state, value) {
      state.bookingInfo.numAdults = value;
    },

    setNumChildren(state, value) {
      state.bookingInfo.numChildren = value;
    },

    setNumToddlers(state, value) {
      state.bookingInfo.numToddlers = value;
    },

    setSelectedRoomsPerType(state, value) {
      state.roomSelection.selectedRoomsPerType[value.list] = parseInt(
        value.newVal
      );

      let sum = 0;
      for (
        let i = 0;
        i < state.roomSelection.selectedRoomsPerType.length;
        i++
      ) {
        sum += state.roomSelection.selectedRoomsPerType[i];
      }
      state.roomSelection.totSelectedRooms = sum;
    },

    setSelectedRoomsRecsPerType(state, value) {
      state.roomSelection.roomIdPerType[value.list] = value.array;

      let tempArray = [];
      for (let i = 0; i < state.roomSelection.roomIdPerType.length; i++) {
        tempArray = tempArray.concat(state.roomSelection.roomIdPerType[i]);
      }

      state.roomSelection.roomsSelected = tempArray;
    },

    clearSelectedRooms(state) {
      state.roomSelection.selectedRoomsPerType = [0, 0, 0, 0];
      state.roomSelection.roomIdPerType = [[], [], [], []];
      state.roomSelection.totSelectedRooms = 0;
      state.roomSelection.roomsSelected = [];
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
      state.hotels = state.originalHotels;

      // Use state.resultSortFilter to create a filtered list
      if (state.resultSortFilter.dist_to_beach) {
        state.hotels = state.hotels.filter(
          (h) => h.distance_to_beach <= state.resultSortFilter.dist_to_beach
        );
      } // distance to beach

      if (state.resultSortFilter.dist_to_town) {
        state.hotels = state.hotels.filter(
          (h) =>
            h.distance_to_town_center <= state.resultSortFilter.dist_to_town
        );
      } // distance to town center

      if (state.resultSortFilter.checkedFiltration.length > 0) {
        state.hotels = state.hotels.filter((h) => {
          let amen = h.amenities.map((a) => a.id);
          return state.resultSortFilter.checkedFiltration.every((a) =>
            amen.includes(a)
          );
        });
      } // filter on amenities

      // Sort each hotels' rooms, always from lowest to highest price
      state.hotels.forEach((h) => h.rooms.sort((a, b) => a.price - b.price));

      // sorting comes here
      let sortPrefix =
        state.resultSortFilter.sortMode == 10 ||
        state.resultSortFilter.sortMode == 30
          ? 1
          : -1;

      if (state.resultSortFilter.sortMode < 30) {
        state.hotels.sort(
          (a, b) => sortPrefix * (a.rooms[0].price - b.rooms[0].price)
        );
      } else {
        state.hotels.sort((a, b) => sortPrefix * (a.grade - b.grade));
      }
    },
  },

  actions: {
    async getCities({ commit }) {
      let response = await fetch("/rest/city");
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
        response = await fetch("/api/whoami");
        let responsee = await response.json();
        commit("setUser", responsee);
        this.state.userLogged = true;
      }
    },

    async isUserLogged({ commit }) {
      let response = await fetch("/api/whoami");
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
      await fetch("/logout", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
      });
      document.cookie =
        "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
      this.state.userLogged = false;
      commit("setUser", null);
    },

    async getCountries({ commit }) {
      let response = await fetch("/rest/country");
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

      let response = await fetch("/rest/search/", {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
        },
        body: JSON.stringify(searchObj),
      });

      response = await response.json();

      commit("setOriginalHotels", response);
      commit("setHotels", response);
      commit("filterHotels", response);
    },
  },

  modules: {},
});
