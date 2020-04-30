<template>
  <div class="container">
    <div class="row">
      <div class="col s12 m5">
        <h5 class="center-align title">Lämna ett omdöme!</h5>
        <!-- <h6 class="center-align title">Du besökte {{ room.hotel_id }}</h6> -->
        <div class="row">
          <div class="grade">
            <star-rating
              :show-rating="false"
              :star-size="40"
              :increment="0.5"
              v-model="reviewRating"
            ></star-rating>
          </div>
        </div>
      </div>
      <!-- <img class="hide-on-small-only" :src="require('@/assets/' + hotel.images[0].url)" /> -->
      <img class="hide-on-small-only hotel-img col m6" :src="require('@/assets/hotel-img/1.jpg')" />
      <form class="col s12">
        <div class="row">
          <div class="input-field col s12">
            <textarea
              id="textareareview"
              v-model="reviewText"
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
        v-on:click="postReview"
      >
        Lämna in
        <i class="material-icons right">send</i>
      </button>
    </div>
  </div>
</template>

<script>
import StarRating from "vue-star-rating";
import M from "materialize-css";

export default {
  components: {
    StarRating
  },
  name: "Review",
  props: [`room`],

  data() {
    return {
      reviewRating: 3,
      reviewText: "",
      review: {
        rating: 0,
        text: "",
        user: {
          id: 0
        },
        hotel: {
          id: 0
        }
      },
      textCountReview: 0
    };
  },

  mounted() {
    document.addEventListener("DOMContentLoaded", function() {
      this.textCountReview = document.querySelectorAll(
        "#input_text, #textareareview"
      );
      M.CharacterCounter.init(this.textCountReview);
    });
  },

  methods: {
    async postReview() {
      this.review.rating = this.reviewRating * 2;
      this.review.text = this.reviewText;
      this.review.user.id = this.$store.state.user.id;
      this.review.hotel.id = 1800;
      // this.hotel.id;

      fetch("/rest/review", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(this.review),
        redirect: "manual"
      });
      console.log(this.review);
      // Close modal, success message
    }
  }
};
</script>

<style scoped>
.title {
  margin-bottom: 20px;
}

.btn {
  border-radius: 25px;
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
