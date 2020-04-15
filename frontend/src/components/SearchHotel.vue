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
        </div>

    </div>
  
</template>

<script>
export default {
    mounted(){
  
    }
    ,
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