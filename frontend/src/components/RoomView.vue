<template>
  <div class="z-depth-1">
    <!-- <div class="divider"></div> -->
    <div class="row">
      <div class="col s8 m10 l7">
        <div class="test valign-wrapper">
          <i class="material-icons small teal-text">people</i>
          <span
            ><em> {{ room.type }} ({{ room.max_occupancy }})</em></span
          >
        </div>
      </div>
      <div class="col s4 m2 l1">
        <span class="teal-text text-darken-2">
          <strong>{{ numFormatter.format(room.price) }}<span>/natt</span></strong>
        </span>
      </div>
    </div>
    <div class="row valign-wrapper hej " v-if="hasExtras()">
      <div class="addition-box col s10  offset-s3 m5 offset-m4 z-depth-1">
         <span>
          <u>Tillval</u>
        </span> 
        <ul>
          <li v-for="e in extras" :key="e.kind">
            <div class="row">
              <div class="col s4 m4 ">
                  <label >
                    <input type="checkbox" class="filled-in" />
                    <span>{{ e.kind }}:</span>
                  </label>
              </div>
              <div class="col s8 m8 right-align">
                <span>{{ numFormatter.format(e.price) }}</span>
              </div>
            </div>
          </li>   
        </ul>
      </div>
    </div>
    <div class="row">
    </div>
  </div>
</template>

<script>
export default {
  name: "RoomView",
  props: [`room`],

  data() {
    return {
      extras: [],
      numFormatter: new Intl.NumberFormat("sv-SE", {
        style: "currency",
        currency: "SEK",
        minimumFractionDigits: 0,
      }),
    };
  },

  mounted() {
    if (this.room.cost_extra_bed && this.room.cost_extra_bed > 0) {
      this.extras.push({ kind: "extrasäng", price: this.room.cost_extra_bed });
    }

    if (this.room.cost_half_board && this.room.cost_half_board > 0) {
      this.extras.push({
        kind: "halvpension",
        price: this.room.cost_half_board,
      });
    }

    if (this.room.cost_full_board && this.room.cost_full_board > 0) {
      this.extras.push({
        kind: "helpension",
        price: this.room.cost_full_board,
      });
    }

    if (this.room.cost_all_inclusive && this.room.cost_all_inclusive > 0) {
      this.extras.push({
        kind: "all inclusive",
        price: this.room.cost_all_inclusive,
      });
    }

  },

  methods: {
    hasExtras: function() {
      return this.extras.length > 0;
      // return (
      //   (this.room.cost_extra_bed && this.room.cost_extra_bed > 0) ||
      //   (this.room.cost_half_board && this.room.cost_half_board > 0) ||
      //   (this.room.cost_full_board && this.room.cost_full_board > 0) ||
      //   (this.room.cost_all_inclusive && this.room.cost_all_inclusive > 0)
      // );
    },
  },
};
</script>

<style scoped>
/* .valign-wrapper go-right {
  justify-content: flex-end;
} */
.room-img {
  width: 250px;
}

span em {
  font-size: 1.5em;
}

ul {
  margin-top: 0;
}

li .row {
  margin-bottom: 0;
}

.button-book{
  padding: 2vh;
 
}

.room-img{
  margin-top: 1em;
}

@media screen and (min-width: 601px) {
.hej{
  margin-left: 1%;
 margin-right: 8%;
}
}

@media screen and (max-width: 600px) {
.hej{
  margin-left: 1%;
  margin-right: 17%;
}
}

@media screen and (min-width: 601px) {
.test{
  margin-left: 50%;
}
}



</style>
