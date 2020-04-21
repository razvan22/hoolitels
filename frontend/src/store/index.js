import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    cities: [],
    displayHotel:{selectedHotel: {}},

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
    },
    setSelectedHotel(state, value){
    state.displayHotel.selectedHotel = value
    }
  },

  actions: {
    async getCities({ commit }) {
      let response = await fetch('http://localhost:8070/rest/city')
      response = await response.json()
      commit('setCities', response)
    },
  },

  modules: {},
})
