<template>
  <div>
    <div class="row">
      <h6>{{ Type.Kind }} - antal lediga rum: {{ Type.count }}</h6>
    </div>
    <div v-for="(p, index) in this.priceRange" :key="index">
      <div class="row valign-wrapper">
        <div class="col s11 l12">
          <span class="room-price"
            >Pris: {{ numFormatter.format(p.room.price) }}</span
          >
        </div>
        <div id="selected-room col s1 l2">
          <select
            v-model="p.selectedRoom"
            @change="onChange($event)"
            class="form-control"
          >
            <option value="0" selected>0</option>
            <option v-for="n in p.count" :key="n" :value="n">{{ n }}</option>
          </select>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import M from "materialize-css";
import { bus } from "../main";

export default {
  name: "RoomTypeItem",
  props: [`Type`, `Number`],
  data() {
    return {
      numFormatter: new Intl.NumberFormat("sv-SE", {
        style: "currency",
        currency: "SEK",
        minimumFractionDigits: 0,
      }),
      priceRange: [],
    };
  },

  computed: {},

  mounted() {
    for (var index = 0; index < this.Type.count; index++) {
      let fIndex = this.priceRange.findIndex((e) => {
        return e.room.price === this.Type.RoomList[index].price;
      });

      if (fIndex > -1) {
        this.priceRange[fIndex].count++;
      } else {
        this.priceRange.push({
          room: this.Type.RoomList[index],
          count: 1,
          selectedRoom: 0,
        });
      } // else

      this.priceRange.sort(function(a, b) {
        return a.room.price - b.room.price;
      });
    } // for index...

    var elems = document.querySelectorAll("select");
    M.FormSelect.init(elems);
  },

  // watch: {
  //   priceRange: function(changes) {
  //     console.log("Hej hopp i watch!!!!!!! ", changes);
  //   },
  // },

  updated() {
    var elems = document.querySelectorAll("select");
    M.FormSelect.init(elems);
  },

  methods: {
    onChange: function(event) {
      bus.$emit("selectedRooms", {
        newVal: event.target.value,
        listNum: this.Number,
      });
    },

    getSelectedRooms: function() {
      for (let p of this.priceRange) {
        console.log("selectedRoom from pricerange ", p.selectedRoom);
      }
    },
  },
};
</script>

<style scoped>
h4 {
  margin-top: 10px;
}

.row {
  margin-bottom: 5px;
}

/* .select-wrapper input.select-dropdown {
  font-size: 10px !important;
} */

.room-price {
  font-size: medium;
}
</style>
