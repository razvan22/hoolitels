<template>
  <div class="row">
    <div class="col s12">
      <div class="card-background">
        <h3> Vem kommer med?</h3>
         <h4> Gäster {{counterAdult + counterChild +counterBaby}}</h4>
         <div class="guests center-align">
           <p><strong> Vuxna </strong></p>
           <a class="btn-floating" v-on:click="counterDecrementAdult()" >
             <i class="material-icons">remove</i></a> {{counterAdult}} <a class="btn-floating"
              v-on:click="counterAdult+=1"><i class="material-icons">add</i></a>
         </div>
          <div class="guests center-align ">
           <p><strong> Barn </strong> </p>
           <a class="btn-floating" v-on:click="counterDecrementChild()">
             <i class="material-icons">remove</i></a> {{counterChild}} <a class="btn-floating"
              v-on:click="counterChild+=1"><i class="material-icons">add</i></a>
         </div>
          <div class="guests center-align ">
           <p><strong> Spädbarn </strong></p>
           <a class="btn-floating"  v-on:click="counterDecrementBaby()">
             <i class="material-icons">remove</i></a> {{counterBaby}} <a class="btn-floating"
              v-on:click="counterBaby+=1"><i class="material-icons">add</i></a>
         </div>
         <div class="row"></div>
         <div class="divider"></div>
             
      <div class="row">
        <form class="col s12">
          <div class="input-field col s12">
            <i class="material-icons prefix">mode_edit</i>
            <textarea id="icon_prefix2" class="materialize-textarea"></textarea>
            <label for="icon_prefix2">Meddelande till hotellet</label>
          </div>
           </form>
        <div class="col s12 center-align">
          <router-link to="/payment">  <a class="waves-effect waves-light btn-small">Fortsätt till betalning</a></router-link>
        </div>
          
      </div> 
      </div>
      </div>
  </div>
</template>

<script>

export default {

  data(){
    return{
    counterAdult: 0,
    counterChild: 0,
    counterBaby: 0,

  }
  },
  methods:{
    counterDecrementAdult(){
      this.counterAdult -=1;
      if (this.counterAdult < 0 )
      this.counterAdult = 0;
      
    },
       counterDecrementChild(){
      this.counterChild -=1;
      if (this.counterChild < 0 )
      this.counterChild = 0;
      
    },
        counterDecrementBaby(){
      this.counterBaby -=1;
      if (this.counterBaby < 0 )
      this.counterBaby = 0;
      
    },


  }


}
</script>

<style>
.card-background{
  background:white;
  

}

</style>