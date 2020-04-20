<template>
    <div class="main" id="date">
        <div class="container">
            <DateSelector/>
                    <div class="row">
                <div class="col  s12 m12 l12">
                    <div class="input-field col s12">
                        <input id="icon_prefix" type="number" v-model="room">
                        <label for="icon_prefix">Ange antal rum</label>
                    </div>
                </div>
            </div>
            <div class="row s12">
                <div class="col s4 l4">
                    <div class="input-field">
                        <input id="meter" type="number" v-model.number="meter">
                        <label for="meter" data-error="wrong" data-success="right">Ange meter:</label>
                        
                    </div>
                    
                </div>
                <div class="col s8 l8">
                    <div class="input-field col s12">
                        <select v-model="place">
                        <option value="" disabled selected>Choose your option</option>
                        <option v-bind:value="{ option: 1}">option 1</option>
                        </select>
                        <label>Platser</label>
                    </div>
                 </div>

                   <div class="input-field col s12">
                        <select v-model="amenity" multiple>
                        <option value="" disabled selected>Faciliteter</option>
                        <option v-bind:value="{ option: 1}">option 1</option>
                        </select>
                      
                    </div>
                 <div class="col s12">
                 <a class="waves-effect waves-light btn">Sök</a>
                 </div>
            </div>
        </div>
    </div>
            
        
    
  
</template>

<script>
  import DateSelector from '@/components/DateSelector.vue'
  import M from 'materialize-css/dist/js/materialize.js'

  export default {
    components: {
      DateSelector,
    },

    data() {
      return {
        counterAdult: 0,
        counterChild: 0,
        counterBaby: 0,
        room: '',
        meter: '',
        amenity: [],
        place: '',
      }
    },

    mounted() {
      let element = document.querySelectorAll('select')
      M.FormSelect.init(element)
    },
    methods: {},
  }
</script>

<style>
  #row-city {
    justify-content: center;
    align-content: center;
  }
  #city {
    justify-content: center;
    align-content: center;
    border-radius: 0.6em;
    border: solid #e0e0e0 0.08em;
    align-content: space-around;
  }

  .main .container .row .col .input-field {
    margin-right: auto;
    display: block;
    justify-content: center;
    align-items: center;
  }
  .main {
    min-height: 20em;
  }
</style>
