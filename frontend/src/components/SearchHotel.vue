<template>
  <div class="main" id="date">
    <div class="container">
      <DateSelector />
    </div>
  </div>
</template>

<script>
import DateSelector from "@/components/DateSelector.vue";
import M from "materialize-css/dist/js/materialize.js";

export default {
  components: {
    DateSelector,
  },

  data() {
    return {
      counterAdult: 0,
      counterChild: 0,
      counterBaby: 0,
      room: "",
      meter: "",
      amenity: [],
      place: "",
    };
  },

  mounted() {
    let element = document.querySelectorAll("select");
    M.FormSelect.init(element);
    var elems = document.querySelectorAll(".datepicker");
    M.Datepicker.init(elems);
  },
  methods: {
    countUpAdult: function() {
      this.counterAdult += 1;
    },
    countUpChild: function() {
      this.counterChild += 1;
    },
    countUpBaby: function() {
      this.counterBaby += 1;
    },
    countDownAdult: function() {
      if (this.counterAdult === 0) return;
      this.counterAdult -= 1;
    },
    countDownChild: function() {
      if (this.counterChild === 0) return;
      this.counterChild -= 1;
    },
    countDownBaby: function() {
      if (this.counterBaby === 0) return;
      this.counterBaby -= 1;
    },
  },
};
</script>

<style>
#row-city {
  justify-content: center;
  align-content: center;
}
#city {
  justify-content: center;
  align-content: center;
  border-radius: 0.6em;
  border: solid #e0e0e0 0.08em;
  align-content: space-around;
}

.main .container .row .col .input-field {
  margin-right: auto;
  display: block;
  justify-content: center;
  align-items: center;
}
.main {
  min-height: 20em;
}
</style>
