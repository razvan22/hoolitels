<template>
  <div>
    <h6>{{ Type.Kind }} - Antal rum: {{ Type.count }}</h6>
    <span>
      <div v-for="(price, index) in this.priceRange" :key="index">
        <span v-if="price.count > 1">
          Pris: {{ numFormatter.format(price.room.price) }}, antal rum:
          {{ price.count }}
        </span>
        <span v-else
          >Pris: {{ numFormatter.format(price.room.price) }}
          <em>Boka!!!</em>
        </span>
      </div>
    </span>
  </div>
</template>

<script>
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
      let fIndex = this.priceRange.indexOf(
        (e) => e.room.price === this.Type.RoomList[index].price
      );

      if (fIndex > -1) {
        this.priceRange[fIndex].count++;
      } else {
        this.priceRange.push({ room: this.Type.RoomList[index], count: 1 });
      } // else

      this.priceRange.sort(function(a, b) {
        return a.room.price - b.room.price;
      });
    } // for index...
  },

  methods: {},
};
</script>

<style scoped>
h4 {
  margin-top: 10px;
}

.row {
  margin-bottom: 0px;
}
</style>
