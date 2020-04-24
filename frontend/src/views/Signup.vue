<template>
  <div class="signup">
    <div id="signup-form">
      <div class="container">
        <div class="container" id="container-bg">
          <div class="row">
            <div class="col s12 m12 l12">
              <div class="input-field">
                <input id="full_name" type="text" class="validate" v-model="user.name" />
                <label for="full_name">Förnamn och efternamn</label>
              </div>
            </div>
            <div class="col s12 m12 l12">
              <div class="input-field">
                <input id="email" type="email" class="validate" v-model="user.email" />
                <label for="email">Epost</label>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col s12 m6 l6">
              <div class="input-field">
                <input id="country" type="text" class="validate" v-model="user.country" />
                <label for="country">Land</label>
              </div>
            </div>
            <div class="col s12 m6 l6">
              <div class="input-field">
                <input id=" city" type="text" class="validate" v-model="user.city" />
                <label for="city">Stad</label>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col s12 m9 l9">
              <div class="input-field">
                <input id="address" type="text" class="validate" v-model="user.address" />
                <label for="address">Adress</label>
              </div>
            </div>
            <div class="col s12 m3 l3">
              <div class="input-field">
                <input id="zip" type="text" class="validate" v-model="user.zip" />
                <label for="zip">Postnummer</label>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col s12 m12 l12">
              <div class="input-field">
                <input id="password" type="password" class="validate" v-model="user.password" />
                <label for="password">Lösenord</label>
              </div>
            </div>
            <div class="col s12 m12 l12">
              <div class="input-field">
                <input
                  id="confirm_password"
                  type="password"
                  class="validate"
                  v-model="user.confirmPassword"
                />
                <label for="confirm_password">Bekräfta lösenord</label>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col s12 m12 l12">
              <div class="col s12 m12 l12">
                <div class="input-field">
                  <input id="telephone" type="tel" class="validate" v-model="user.phone" />
                  <label for="telephone">Telefonnummer</label>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="container">
          <div class="row" id="submit-btn">
            <div class="col">
              <button
                v-on:click="consoleLogForm()"
                class="btn-large waves-effect waves-light"
                type="submit"
                name="action"
              >
                Submit
                <i class="material-icons right">send</i>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>





<script>
export default {
  name: "Signup",
  data() {
    return {
      user: {
        name: "",
        email: "",
        country: "",
        city: "",
        address: "",
        zip: "",
        password: "",
        confirmPassword: "",
        phone: ""
      }
    };
  },
  mounted() {},
  methods: {
    consoleLogForm: function() {
      console.log(this.user);
    }
  }
};
</script>

<style scoped>
.container #submit-btn {
  margin-top: 4em;
  display: flex;
  align-items: center;
  justify-content: center;
}
#signup-form #container-bg {
  display: flex;
  flex-direction: column;
  border-radius: 1em;
  background: white;
}

#signup-form {
  display: flex;
  flex-direction: column;
}
</style>