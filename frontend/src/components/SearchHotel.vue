<template>
    <div class="main">
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
                <div class="col s12 m12 l12">
                    <label for="startDate" class="materialize-label">Start Date</label>
                    <input id="startDate" ref="startDate" type="date" size="12" class="startDate timepicker">
                </div>
            </div>
            <input type="text" class="datepicker">

              <div class="input-field col s12">
              </div>

                <div class="input-field col s12">
                </div>

                 <div class="row"></div>
        
                <div class="row"></div>
                <div class="col  s12 m12 l12">
                         <div class="input-field col s6">
                        <input id="icon_prefix" type="number">
                        <label for="icon_prefix">RUM</label>
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

    </div>
  
</template>

<script>


export default {


    mounted(){
     
      

    },

    methods:{
      
      
     
    }    
      
}

  
</script>



<style>

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