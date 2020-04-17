import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    cities: [],

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
