<template>

    <div class="main" id="date">
        <div class="container">
            <div class="row">
                <div class="col s12 m5 l3">
                    <label>Antal personer</label>
                        <div class="col s11">
                            <span> Vuxna 12+ år</span>
                            <button v-on:click="countDownAdult">-</button>
                            <span> {{ counterAdult }}</span>
                            <button v-on:click="countUpAdult">+</button>   
                        </div>
                       <div class="col s12">
                            <span> Barn 2+ år</span>
                                <button v-on:click="countDownChild">-</button>
                                <span> {{ counterChild }}</span>
                                <button v-on:click="countUpChild">+</button>   
                        </div>
                       <div class="col s12 l12">
                            <span> Barn -2 år</span>
                            <button v-on:click="countDownBaby">-</button>
                            <span> {{ counterBaby }}</span>
                            <button v-on:click="countUpBaby">+</button>   
                        </div>
                </div>

            </div>
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
// computed: {
//   date: {
//     get () {
//       return this.$store.state.obj.date
//     },
//     set (value) {
//       this.$store.commit('setDate', value)
//     }
//   }
// }

import M from '@/assets/materialize.min.js'
export default {
    data(){
       return{
            counterAdult: 0, 
            counterChild: 0, 
            counterBaby: 0,
            room: "",
            meter: "",
            amenity: "",
            place:"",
       }
    },
  

    mounted(){
        let elems = document.querySelectorAll('.datepicker');
        M.Datepicker.init(elems);
        let element = document.querySelectorAll('select');
        M.FormSelect.init(element);
      
    },

    methods:{
        countUpAdult: function(){
            this.counterAdult +=1
        },
          countUpChild: function(){
            this.counterChild +=1
        },
         countUpBaby: function(){
            this.counterBaby +=1
        },
          countDownAdult: function(){
            if (this.counterAdult === 0) return
            this.counterAdult -=1
        },
          countDownChild: function(){
            if (this.counterChild === 0) return
            this.counterChild -=1
        },
         countDownBaby: function(){
            if (this.counterBaby === 0) return
            this.counterBaby -=1
        },
    }

}
</script>
<style>
.main{
    min-height: 20em;
}

</style>