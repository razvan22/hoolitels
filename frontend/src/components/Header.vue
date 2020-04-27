<template>
  <div id="header">
    <div class="row row1">
      <div class="col m3"></div>
      <div class="col s12 m6">
        <div class="col s3"></div>
        <img src="../assets/logo_minimal.gif" class="logo" />

        <i
          data-target="slide-out"
          class="white-text medium material-icons sidenav-trigger waves-effect waves-light col s3"
        >account_circle</i>
      </div>
      <div class="col m3"></div>
    </div>
    <ul id="slide-out" class="sidenav">
      <div class="row side2">
        <div class="col s12 m12 l12">
          <img src="../assets/logo_minimal.gif" class="responsive" />
        </div>
        <div class="container">
          <div class="row navrow">
            <div class="input-field col s12 m12 l12">
              <h5>Login</h5>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12 m12 l12">
              <label for="email">Email</label>
              <input id="email" type="email" class="validate" v-model="email" />
            </div>
            <div class="input-field col s12 m12 l12">
              <label for="password" class="validate">Password</label>
              <input id="password" type="password" v-model="password" />
            </div>
            <div class="input-field col s12 m12 l12">
              <button
                class="btn waves-effect waves-light"
                type="submit"
                v-on:click="loginSubmit()"
                name="action"
              >Login</button>
            </div>
            <div class="col s12 m12 l12">
              <router-link to="/signup">
                <p>Don't have an account ?</p>
              </router-link>
            </div>
          </div>
        </div>
      </div>
    </ul>
  </div>
</template>

<script>
// import Signup from '../views/Signup.vue'
import M from "materialize-css/dist/js/materialize.js";
export default {
  data() {
    return {
      email: "",
      password: ""
    };
  },
  mounted() {
    this.springLogin();

    let loginForm = document.querySelectorAll(".sidenav");
    M.Sidenav.init(loginForm, { edge: "right" });
  },
  methods: {
    async springLogin() {
      let username = "tsuddickdw@accuweather.com";
      let password = "9swmyDhmvTp";

      const credentials =
        "username=" +
        encodeURIComponent(username) +
        "&password=" +
        encodeURIComponent(password);

      let response = await fetch("/login", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: credentials,
        redirect: "manual"
      });

      try {
        response = await fetch("api/whoami");
        response = await response.json();
        console.log(response);
        return true;
      } catch {
        console.log("Login failed");
        return false;
      }
    }
  }
};
</script>

<style scoped>
#header .logo {
  /* display: block;
    margin-left: auto;
    margin-right: auto  */
  margin-top: 30px;
  width: 70%;
}

#header .sidenav-trigger {
  margin: 10px;
}

#header .row1 {
  display: flex;
  align-content: flex-end;
  justify-content: flex-end;
}

/* #header >>> .row {
  display: inline;
} */

#header .row .col {
  justify-content: center;
  display: flex;
}
#header .row .responsive {
  width: 70%;
  height: auto;
}

#header .row i {
  /* font-size: 2em; */
  /* color: #006064; */
}
</style>
