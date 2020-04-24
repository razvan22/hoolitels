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
    user:{},
    disable:{
      headerDisabled: false,
      editUserInfo: true
    }
    

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

    setUser(state, value){
      state.user = value;
    },

    disableHeader(state, value){
      state.headerDisabled = value;
    }
    
  },

  actions: {
    async getCities({ commit }) {
      let response = await fetch('rest/city')
      response = await response.json()
      commit('setCities', response)
    },
    
    async springLogin({ commit },credent) {
     let credentials =
        'username=' + encodeURIComponent(credent.email) +
        '&password=' + encodeURIComponent(credent.password)

      let response = await fetch('/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: credentials,
        redirect: 'manual',
      })
      if (response.url.includes('error')) {
        console.log('Wrong username/password')
      } else {
        response = await fetch('api/whoami')
        let responsee = await response.json()
       commit('setUser', responsee)
       console.log(responsee)
       this.state.disable.headerDisabled = true;
      }
    },
   
    async getAmenities({ commit }) {
      let response = await fetch('/rest/amenity')
      response = await response.json()
      commit('setAmenities', response)
    },
  },

  modules: {},
})
