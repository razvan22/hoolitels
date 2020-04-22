<template>
  <div id="header">
    <div class="container">
      <div class="row row-form">
        <div class="col s3 m2 l2">
          <i
            data-target="slide-out"
            class="large material-icons  sidenav-trigger waves-effect waves-light"
            >account_circle</i
          >
          <ul id="slide-out" class="sidenav">
            <div class="row">
              <div class="col s12 m12 l12">
                <img src="../assets/logo_minimal.gif" class="responsive" />
              </div>
              <div class="container">
                <div class="row">
                  <div class="input-field col s12 m12 l12">
                    <h5>Login</h5>
                  </div>
                </div>
                <div class="row">
                  <div class="input-field col s12 m12 l12">
                    <label for="email">Email</label>
                    <input
                      id="email"
                      type="email"
                      class="validate"
                      v-model="email"
                    />
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
                    >
                      Login
                    </button>
                  </div>
                  <div class="col s12 m12 l12">
                    <router-link to="/signup"
                      ><p>Don't have an account ?</p></router-link
                    >
                  </div>
                </div>
              </div>
            </div>
          </ul>
        </div>
      </div>
      <div class="row">
        <div class="col s12 m12 l12">
          <img src="../assets/logo_minimal.gif" class="responsive" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  // import Signup from '../views/Signup.vue'
  import M from 'materialize-css/dist/js/materialize.js'
  export default {
    data() {
      return {
        email: '',
        password: '',
      }
    },
    mounted() {
      this.springLogin()

      let loginForm = document.querySelectorAll('.sidenav')
      M.Sidenav.init(loginForm, { edge: 'right' })
    },
    methods: {
      async springLogin() {
        let username = 'user'
        let password = 'user'

        const credentials =
          'username=' +
          encodeURIComponent(username) +
          '&password=' +
          encodeURIComponent(password)

        let response = await fetch('/login', {
          method: 'POST',
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
          body: credentials,
          redirect: 'manual',
        })

        if (response.url.includes('error')) {
          console.log('Wrong username/password')
        } else {
          response = await fetch('api/whoami')
          response = await response.json()
          console.log(response)
        }
      },
      loginSubmit() {
        console.log(this.password, this.email)
      },
    },
  }
</script>

<style scoped>
  #header .container .row-form {
    display: flex;
    align-content: flex-end;
    justify-content: end;
    margin-top: 2em;
  }

  #header .container .row .col {
    justify-content: center;
    display: flex;
  }
  #header .container .row .responsive {
    width: 70%;
    height: auto;
  }

  #header .container .row i {
    font-size: 4em;
    color: #006064;
  }
</style>
