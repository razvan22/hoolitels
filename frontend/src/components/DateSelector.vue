<template>
<div class="date_selector container">
    <div class="row" id="date-city-selector">
        
         <div class="input-field col s12">
            <select v-model="selected" class="browser-default" id="citySelected">
                <option value="" disabled selected>välj stad</option>
                <option  v-for="city in cities" :key='city.id' :value='city.id' >{{city.name}}</option>
            </select>
            
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
            },
            selected:''
            ,
            cities:[]
        }
    },
    mounted(){
        let elems = document.querySelectorAll('.datepicker');
        M.Datepicker.init(elems);
        let selectOption = document.querySelectorAll('select');
        M.FormSelect.init(selectOption);
        this.getCity();
    },
    methods:{
        getCity: async function(){
            let response = await fetch('http://localhost:8070/rest/city');
            response = await response.json();
            this.cities  = response;
            console.log(this.cities)
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