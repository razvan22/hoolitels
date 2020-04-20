<template>
  <div class="main">
    <DateSelector />
  </div>
</template>

<script>
  import DateSelector from '@/components/DateSelector.vue'
  import M from 'materialize-css/dist/js/materialize.js'

  export default {
    components: {
      DateSelector,
    },

    data() {
      return {
        counterAdult: 0,
        counterChild: 0,
        counterBaby: 0,
        room: '',
        meter: '',
        amenity: [],
        place: '',
      }
    },

    mounted() {
      let element = document.querySelectorAll('select')
      M.FormSelect.init(element)
    },
    methods: {},
  }
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
