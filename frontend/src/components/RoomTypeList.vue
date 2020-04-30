<template>
  <div>
    <div v-for="(t, index) in this.TypeList" :key="index">
      <div v-if="t.count > 0">
        <RoomTypeItem :Type="t" :Number="index" />
        <div class="divider"></div>
      </div>
    </div>
  </div>
</template>

<script>
import RoomTypeItem from "@/components/RoomTypeItem";

export default {
  name: "RoomTypeList",
  props: [`rooms`],
  data() {
    return {
      TypeList: [
        { Kind: "", count: 0, PriceMin: 9999999, PriceMax: 0, RoomList: [] },
        { Kind: "", count: 0, PriceMin: 9999999, PriceMax: 0, RoomList: [] },
        { Kind: "", count: 0, PriceMin: 9999999, PriceMax: 0, RoomList: [] },
        { Kind: "", count: 0, PriceMin: 9999999, PriceMax: 0, RoomList: [] },
      ],
    };
  },

  computed: {},

  created() {
    for (var index = 0; index < this.rooms.length; index++) {
      let tIndex = this.rooms[index].max_occupancy - 1;

      this.TypeList[tIndex].count++;
      this.TypeList[tIndex].Kind = this.rooms[index].type;
      this.TypeList[tIndex].RoomList.push(this.rooms[index]);

      if (this.rooms[index].price < this.TypeList[tIndex].PriceMin) {
        this.TypeList[tIndex].PriceMin = this.rooms[index].price;
      }

      if (this.rooms[index].price > this.TypeList[tIndex].PriceMax) {
        this.TypeList[tIndex].PriceMax = this.rooms[index].price;
      }
    }
  },

  mounted() {
    console.log(this.$refs);
  },

  components: {
    RoomTypeItem,
  },

  methods: {
    // getSelectedRoom: function(){
    //   console.log("RoomTypeList getselectedRoom")
    //   for(let ref in this.$refs){
    //     console.log(ref)
    //      this.$refs[ref].getSelectedRooms()
    //   }
    // }
  },
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
