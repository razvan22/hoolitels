<template>
  <div class="body">
    <div class="container payment-form">
      <div class="row">
        <div class="input-field col s12">
          <input
            placeholder="Förnamn och efternamn"
            type="text"
            class="validate"
            id="first_name"
            required=""
            aria-required="true"
          />
          <label for="first_name" class="active">Kortinnehavare</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input
            placeholder="XXXX-XXXX-XXXX-XXXX"
            type="number"
            class="validate"
            id="card_number"
            required=""
            pattern="[0-4]"
            aria-required="true"
          />
          <label for="card_number" class="active">Kortnummer</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s6">
          <input
            placeholder="XXX"
            type="number"
            class="validate"
            id="cvc"
            required=""
            aria-required="true"
          />
          <label for="cvc" class="active">CVC</label>
        </div>
        <div class="input-field col s6">
          <input
            placeholder="XX/XX"
            type="number"
            class="validate"
            id="expiration_date"
            required=""
            aria-required="true"
          />
          <label for="expiration_date" class="active">Utgångsdatum</label>
        </div>
        <div class="row">
          <!-- <div class="col align-center offset-s4 offset-m5 offset-l5"> -->
          <div class="col align-center offset-s1 offset-m4 offset-l4">
            <a
              class="btn-payment waves-effect waves-light btn modal-trigger cyan darken-2 align-center"
              @click="saveBooking"
              >Godkänn och betala din bokning</a
            >
          </div>
        </div>
      </div>
    </div>
    <div>
      <modal
        name="bookingsuccessful"
        :height="230"
        :width="500"
        :border-radius="200"
      >
        <div class="promp">
          <div class="modal-content">
            <div class="center-align">
              <i class="green-text material-icons medium">check_circle</i>
            </div>
            <h5 class="center-align">Vi har tagit emot din betalning</h5>
            <p class="center-align">Tack för din bokning!</p>
          </div>
          <div class="modal-footer center-align">
            <router-link to="/userprofile">
              <div
                class="waves-effect waves-light btn cyan darken-2 btn-payment"
              >
                Klicka här för att gå till din profil
              </div>
            </router-link>
          </div>
        </div>
      </modal>
    </div>
    <modal name="bookingfailed" :height="150" :width="500" :border-radius="200">
      <div id="promp">
        <h5 class="center red-text">
          Fel vid bokning! Var god försök senare.
        </h5>

        <div class="center">
          <button
            @click="hide"
            class="btn-register-2 btn-small waves-effect waves-light cyan darken-2"
            name="action"
          >
            Ok
          </button>
        </div>
      </div>
    </modal>
  </div>
</template>

<script>
// import M from "materialize-css";

export default {
  mounted() {
    // let elems = document.querySelectorAll(".modal");
    // M.Modal.init(elems);
  },

  computed: {
    rooms: {
      get: function() {
        return this.$store.state.roomSelection.roomsSelected;
      },
    },

    numAdults: {
      get: function() {
        return this.$store.state.bookingInfo.numAdults;
      },

      set: function(value) {
        this.$store.commit("setAdults", value);
      },
    },

    numChildren: {
      get: function() {
        return this.$store.state.bookingInfo.numChildren;
      },

      set: function(value) {
        this.$store.commit("setChildren", value);
      },
    },

    numToddlers: {
      get: function() {
        return this.$store.state.bookingInfo.numToddlers;
      },

      set: function(value) {
        this.$store.commit("setToddlers", value);
      },
    },

    startDate() {
      return this.$store.state.booking.check_in;
    },

    endDate() {
      return this.$store.state.booking.check_out;
    },

    message: {
      get: function() {
        return this.$store.state.bookingInfo.message;
      },

      set: function(value) {
        this.$store.commit("setMessageToHotel", value);
      },
    },
  },

  methods: {
    saveBooking: async function() {
      let bookingObj = {};

      bookingObj.user = { id: this.$store.state.user.id };
      bookingObj.roombookings = [];
      this.rooms.forEach((r) => {
        bookingObj.roombookings.push({
          room: { id: r.id },
          extra_bed: 0,
          food_cost: 0,
          room_cost: r.price,
        });
      });

      bookingObj.num_adults = this.numAdults;
      bookingObj.num_children = this.numChildren;
      bookingObj.num_infants = this.numToddlers;
      bookingObj.start_date = this.startDate;
      bookingObj.end_date = this.endDate;
      bookingObj.comment = this.message;
      bookingObj.paid = true;

      console.log("bookingObj: ", JSON.stringify(bookingObj));

      let rawResponse = await fetch("/rest/booking", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Accept-Encoding": "gzip, deflate, br",
        },
        body: JSON.stringify(bookingObj),
      });

      console.log(rawResponse);

      if (rawResponse.status == 200) {
        this.numAdults = 0;
        this.numChildren = 0;
        this.numToddlers = 0;
        this.message = "";
        this.$store.commit("clearSelectedRooms");
        this.successfulShow();
      } else {
        this.failedShow();
      } // else

      let response = await rawResponse.json();
      console.log(response);
    },

    successfulShow() {
      this.$modal.show("bookingsuccessful");
    },

    failedShow() {
      this.$modal.show("bookingfailed");
    },

    hide() {
      this.$modal.hide("bookingfailed");
    },
  },
};
</script>

<style scoped>
.payment-form {
  background: white;
  padding-top: 2vh;
}
.btn-payment {
  border-radius: 25px;
}

.modal-footer {
  text-align: center;
}

.modal-content {
  padding-bottom: 0.2em;
}
</style>
