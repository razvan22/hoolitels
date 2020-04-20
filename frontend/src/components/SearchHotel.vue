<template>
<div class="container">
    <div class="main" id="date">
        <div class="container">
            <DateSelector/>
        </div>
    </div>
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
