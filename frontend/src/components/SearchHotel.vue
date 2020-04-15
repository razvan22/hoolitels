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
                <div class="col s3">
                     <input type="text" class="datepicker">
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