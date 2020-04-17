import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {

  dateSelected:{
    selectedCity: 0
  },

  hotels:[]

  },
  mutations: {
  setSelectedCity(state, value){
    state.dateSelected.selectedCity = value;
  }

  },

  actions: {
  },

  modules: {
  }
})
