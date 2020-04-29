<template>
<div class="container">
   <div class="row">
    <div class="col s12 offset-l1 l9 center-align">
      <div class="card-background">
       <div >
        <RoomView
            v-for="r in rooms"
            :key="r.id"
            :room="r"
          />
        </div>      
        <h6>Vem kommer med?</h6>
         <h5>Gäster {{counterAdult + counterChild +counterBaby}}</h5>
         <div class="guests center-align">
           <p><strong> Vuxna </strong></p>
           <a class="btn-floating cyan darken-2" v-on:click="counterDecrementAdult()" >
             <i class="material-icons">remove</i></a> {{counterAdult}} <a class="btn-floating cyan darken-2"
              v-on:click="counterAdult+=1"><i class="material-icons">add</i></a>
         </div>
          <div class="guests center-align ">
           <p><strong> Barn </strong></p>
           <a class="btn-floating cyan darken-2" v-on:click="counterDecrementChild()">
             <i class="material-icons">remove</i></a> {{counterChild}} <a class="btn-floating cyan darken-2"
              v-on:click="counterChild+=1"><i class="material-icons">add</i></a>
         </div>
          <div class="last-button guests center-align ">
           <p><strong> Spädbarn </strong></p>
           <a class="btn-floating cyan darken-2"  v-on:click="counterDecrementBaby()">
             <i class="material-icons">remove</i></a> {{counterBaby}} <a class="btn-floating cyan darken-2"
              v-on:click="counterBaby+=1"><i class="material-icons">add</i></a>
         </div>
         <div class="divider"></div>   
      <div class="row">
        <form class="col s12 ">
          <div class="input-field col s12">
            <i class="material-icons prefix">mode_edit</i>
            <textarea id="icon_prefix2" class="materialize-textarea"></textarea>
            <label for="icon_prefix2">Meddelande till hotellet</label>
          </div>
           </form>
        <div class="col s12 center-align">
          <router-link to="/payment">  <a class="btn-continue-payment waves-effect waves-light btn-small cyan darken-2 r">Fortsätt till betalning</a></router-link>
        </div> 
      </div> 
      </div>
    </div>
  </div>
  </div>
</template>

<script>

import RoomView from "@/components/RoomView";

export default {

  components: {
    RoomView,
  },

  data(){
    return{
      counterAdult: 0,
      counterChild: 0,
      counterBaby: 0,
    }
  },

  computed: {
    rooms() {
      return this.$store.state.roomSelection.roomsSelected;
      // let rArray = [];
      // for (let i = 0; i < this.$store.state.roomSelection.roomIdPerType.length; i++) {
      //   if (this.$store.state.roomSelection.roomIdPerType[i])
      //     rArray = [...rArray, ...this.$store.state.roomSelection.roomIdPerType[i]];
      // }

      // return rArray;
    },
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
  padding-bottom: 1%;

}

.btn-continue-payment{
  border-radius: 25px;

}

.last-button{
  margin-bottom: 7%;
}
</style>