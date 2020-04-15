<template>
<div class="date_selector container">
    <div class="row" id="date-city-selector">
        <div class="input-field col s12 m6 l6">
            <input id="textarea1" type="text" class="validate" v-model='booking.city' @keyup.enter="getCity">
            <label for="textarea1">City</label>
        </div>
        <div class="input-field col s6 m3 l3">
            <input id="from" type="text" class="datepicker" v-model='booking.check_in'  >
            <label for="from">Check-in Date</label>
        </div>
         <div class="input-field col s6 m3 l3">
            <input id="to" type="text" class="datepicker" v-model='booking.check_out'>
            <label for="to">Check-out Date</label>
        </div>
    </div>
</div>
</template>

<script>
import M from '@/assets/materialize.min.js'
export default {
    data(){
        return{
            booking:{
                city: '',
                check_in:'',
                check_out:'' 
            }
        }
    },
    mounted(){
        let elems = document.querySelectorAll('.datepicker');
        M.Datepicker.init(elems);
    },
    methods:{
        getCity: function(){
            console.log(this.booking.city,this.booking.check_in,this.booking.check_out)
            this.city = ''
        }
    }
}
</script>

<style>
#date-city-selector{
    margin-top: 1em;
    border: solid 1px #e0e0e0 ;
    border-radius: 0.30em;
}
</style>