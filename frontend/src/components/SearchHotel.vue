<template>

    <div class="main" id="date">
        <div class="container">
            <div class="row">
                <div class="col s12 m12 l12">
                    <div class="input-field col s12">
                        <input id="icon_prefix" type="text" class="validate">
                        <label for="icon_prefix">CITY</label>
                    </div>
                </div>

                <div class="col s8 m5 l3">
                    <label>Antal personer</label>
                    <div id="change">
                        <span> Vuxna 12+ </span>
                          <button v-on:click="countDownAdult"> -</button>
                            <span> {{ counterAdult }}</span>
                            <button v-on:click="countUpAdult"> +</button>   
                    </div>
                       <div id="change">
                        <span> Barn 2+ </span>
                          <button v-on:click="countDownChild"> -</button>
                            <span> {{ counterChild }}</span>
                            <button v-on:click="countUpChild"> +</button>   
                    </div>
                       <div id="change">
                        <span> Småbarn 12+ </span>
                          <button v-on:click="countDownBaby"> -</button>
                            <span> {{ counterBaby }}</span>
                            <button v-on:click="countUpBaby"> +</button>   
                    </div>
                </div>

  
            </div>
            <div class="row">
                <div class="col  s12 m12 l12">
                    <div class="input-field col s12">
                        <input id="icon_prefix" type="number">
                        <label for="icon_prefix">ROOMS</label>
                    </div>
                </div>
            </div>
            <div class="row s12">
                <div class="col s4 l4">
                     Avstånd till: 
                    <div class="input-field inline">
                        <input id="meter" type="number">
                        <label for="meter" data-error="wrong" data-success="right">ange meter</label>  
                    </div>
                    
                </div>
                <div class="col s8 l8">
                    <div class="input-field col s12">
                        <select>
                        <option value="" disabled selected>Choose your option</option>
                        <option value="1">Option 1</option>
                        <option value="2">Option 2</option>
                        <option value="3">Option 3</option>
                        </select>
                        <label>Platser</label>
                    </div>
                 </div>

                   <div class="input-field col s12">
                        <select multiple>
                        <option value="" disabled selected>Amenities</option>
                        <option value="1">Option 1</option>
                        <option value="2">Option 2</option>
                        <option value="3">Option 3</option>
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