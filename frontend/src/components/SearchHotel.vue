<template>
    <div class="main" id="date">
        <div class="container">
            <div class="row">
                <div class="col s12 m12 l12">
                    <div class="input-field col s6">
                        <input id="icon_prefix" type="text" class="validate">
                        <label for="icon_prefix">CITY</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col  s12 m12 l12">
                    <div class="input-field col s6">
                        <input id="icon_prefix" type="number">
                        <label for="icon_prefix">RUM</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col s6">
                    <p> Avstånd till (meter)</p>
                    <div class="input-field inline">
                        <input id="meter" type="number">
                        <label for="meter" data-error="wrong" data-success="right">meter</label>
                    </div>
                </div>
                <div class="col s6">
                    <div class="input-field col s12">
                        <select>
                        <option value="" disabled selected>Choose your option</option>
                        <option value="1">Option 1</option>
                        <option value="2">Option 2</option>
                        <option value="3">Option 3</option>
                        </select>
                        <label>Materialize Select</label>
                    </div>
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
    components: {
    },

    data(){
        return{
         

        }

    },

    mounted(){
        let elems = document.querySelectorAll('.datepicker');
        M.Datepicker.init(elems);
        let element = document.querySelectorAll('select');
        M.FormSelect.init(element);
    }
    ,
    methods:{
        date: function(){

        }
    }
}


</script>


<style>
.row .col.s6 .input-class{
    border: solid red 1px;
}
.main .container .row {
    direction: flex;
}
.main .container .row .col .input-field{
    margin-right: auto;
    display: block;
    justify-content: center;
    align-items: center;
}
.main{
    min-height: 20em;
}

</style>