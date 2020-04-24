import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    cities: [],
    amenities: [],
    dateSelected: {
    selectedCity: 0,
    },

    hotels: [],
  },
  mutations: {
    setSelectedCity(state, value) {
      state.dateSelected.selectedCity = value
    },
    setCities(state, value) {
      state.cities = value
      console.log('city', state.cities)
    },
    setAmenities(state, value) {
      state.amenities = value
      console.log('amenities', state.amenities)
    },

  },

  actions: {
    async getCities({ commit }) {
      let response = await fetch('http://localhost:8070/rest/city')
      response = await response.json()
      commit('setCities', response)
    },
    async getAmenities({ commit }) {
      let response = await fetch('/rest/amenity')
      response = await response.json()
      commit('setAmenities', response)
    },
  },

  modules: {},
})
