<template>
  <div class="container">
    <div class="card">
      <div class="row">
        <div class="col s12 m5">
          <h5 class="center-align title">
            <i class="material-icons prefix teal-text">mode_edit</i> Lämna ett
            omdöme!
          </h5>
          <h6 class="center-align title">Du besökte hoteldotname</h6>
          <div class="row">
            <div class="grade">
              <star-rating
                :show-rating="false"
                :star-size="40"
                :increment="0.5"
                v-model="rating"
              ></star-rating>
            </div>
          </div>
        </div>
        <!-- <img class="hide-on-small-only" :src="require('@/assets/' + hotel.images[0].url)" /> -->
        <img
          class="hide-on-small-only hotel-img col m6"
          :src="require('@/assets/hotel-img/1.jpg')"
        />
        <form class="col s12">
          <div class="row">
            <div class="input-field col s7">
              <input
                id="input_text"
                type="text"
                data-length="20"
                maxlength="20"
              />
              <label for="input_text">Rubrik</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <textarea
                id="textareareview"
                class="materialize-textarea"
                data-length="120"
                maxlength="120"
              ></textarea>
              <label for="textareareview">Din recension...</label>
            </div>
          </div>
        </form>
      </div>
      <div class="right-align">
        <button
          class="btn waves-effect waves-light"
          type="submit"
          name="action"
          :disabled="!isSendable"
        >
          Lämna in
          <i class="material-icons right">send</i>
        </button>
      </div>
    </div>
  </div>
</template>

<script>
  import StarRating from 'vue-star-rating'
  import M from 'materialize-css'

  export default {
    components: {
      StarRating,
    },
    name: 'Review',
    props: [`hotel`],

    data() {
      return {
        textCountTitle: 0,
        textCountReview: 0,
        isSendable: false,
        rating: 3,
      }
    },

    mounted() {
      document.addEventListener('DOMContentLoaded', function() {
        this.textCountTitle = document.querySelectorAll(
          '#input_text, #textareatitle'
        )
        this.textCountReview = document.querySelectorAll(
          '#input_text, #textareareview'
        )
        M.CharacterCounter.init(this.textCountTitle)
        M.CharacterCounter.init(this.textCountReview)
      })
    },

    methods: {},
  }
</script>

<style scoped>
  .title {
    margin-bottom: 20px;
  }

  .hotel-img {
    float: right;
  }

  .grade {
    margin-left: 55px;
  }

  .card {
    padding: 20px !important;
  }
</style>
