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
    userLogged: false,
   
  },

  mutations: {
    setSelectedCity(state, value) {
      state.dateSelected.selectedCity = value
    },

    setCities(state, value) {
      state.cities = value
    },

    setAmenities(state, value) {
      state.amenities = value
    },

    setUser(state, value){
      state.user = value;
    },

    userLogStatus(state, value){
      state.userLogged = value
    },

    
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
       this.state.userLogged = true;
      }

    },
      async isUserLogged({ commit }){
        let response = await fetch('api/whoami')
        let responsee = await response.json()

        if(responsee == null){
          this.state.userLogged = false;
          
        }else{
          this.state.userLogged = true;
        }
        console.log(responsee)
       commit('setUser', responsee)
    },
   
    async getAmenities({ commit }) {
      let response = await fetch('/rest/amenity')
      response = await response.json()
      commit('setAmenities', response)
    },

    async logout( {commit} ){
      await fetch('http://localhost:8070/logout', {
        method: "POST",
        headers: { "Content-Type": "application/json" },
      });
      document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
      this.state.userLogged = false;
      commit('setUser', null)
    }
  },



  modules: {},
})
