<template>
  <div>
    <div class="row">
      <h6>{{ Type.Kind }} - antal rum: {{ Type.count }}</h6>
    </div>
    <div v-for="(p, index) in this.priceRange" :key="index">
      <div v-if="p.count > 1">
        <div class="row">
          <div class="col s4">
            <span
              >Pris: {{ numFormatter.format(p.room.price) }} ({{
                p.count
              }})</span
            >
          </div>
          <div class="col s3 center-align">
            <select v-model="p.selectedRoom">
              <!-- <option value disabled selected>Välj antal rum</option> -->
              <option
                v-for="n in p.count"
                :key="n"
                :value="n"
                :selected="n === 1 ? true : false"
                >{{ n }}</option
              >
            </select>
          </div>
          <div class="col s5 right-align">
            <router-link
              to="/"
              class="waves-effect waves-light cyan darken-2 btn-small"
              >Boka</router-link
            >
          </div>
        </div>
      </div>
      <div v-else>
        <div class="row">
          <div class="col s9">
            <span>Pris: {{ numFormatter.format(p.room.price) }}</span>
          </div>
          <div class="col s1 button-book">
            <router-link
              to="/"
              class="waves-effect waves-light cyan darken-2 btn-small"
              >Boka</router-link
            >
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import M from "materialize-css";
export default {
  name: "RoomTypeItem",
  props: [`Type`],
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
          selectedRoom: -1,
        });
      } // else

      this.priceRange.sort(function(a, b) {
        return a.room.price - b.room.price;
      });
    } // for index...

    var elems = document.querySelectorAll("select");
    M.FormSelect.init(elems);
  },

  updated() {
    var elems = document.querySelectorAll("select");
    M.FormSelect.init(elems);
  },

  methods: {},
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
</style>
