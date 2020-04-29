<template>
  <div>
    <div class="container">
      <div class="row">
        <UserInformationForm />
        <div class="col s12 m12 l12">
          <ul class="collapsible">
            <li>
              <div class="collapsible-header">
                <i class="material-icons">notes</i>Dina bokningar
              </div>
              <div class="collapsible-body">
                <booking-componet></booking-componet>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import M from "materialize-css/dist/js/materialize.js";
import UserInformationForm from "../components/UserInformationForm";
import BookingComponet from "../components/BookingComponent.vue";
export default {
  components: {
    BookingComponet,
    UserInformationForm
  },
  computed: {
    currentUser() {
      return this.$store.state.user;
    }
  },
  methods: {
    editUserInfo() {
      this.$store.state.disable.editUserInfo = false;
    }
  },
  mounted() {
    let colap = document.querySelectorAll(".collapsible");
    M.Collapsible.init(colap);
  }
};
</script>

<style scoped>
.collapsible-body {
  background: white;
}

.container .row .book {
  margin-top: 1vh;
}

div #nav {
  padding: 3vh 2vw 0vh 2vw;
}

img {
  width: 40%;
  height: auto;
}

body #userName {
  flex-direction: column;
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
