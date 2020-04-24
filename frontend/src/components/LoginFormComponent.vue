<template>
  <div id="login">
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
                    <label for="username">Email</label>
                    <input
                      id="username"
                      type="text"
                      class="validate"
                      v-model="user.email"
                    />
                  </div>
                  <div class="input-field col s12 m12 l12">
                    <label for="password" class="validate">Password</label>
                    <input id="password" type="password" v-model="user.password" />
                  </div>
                  <div class="input-field col s12 m12 l12">
                    <router-link to="/userprofile">
                        <button
                          class="btn waves-effect waves-light"
                          type="submit"
                          v-on:click="login()"
                          name="action">Login
                      </button>
                    </router-link>
                  </div>
                  <div class="col s12 m12 l12">
                    <router-link to="/signup"
                      ><p>Don't have an account ?</p></router-link>
                  </div>
                </div>
              </div>
            </div>
  </div>
</template>

<script>
export default {
    name: 'LoginFormComponent',
        data() {
        return {
          user:{
            email:'',
            password:''
          },

        }
    },
    methods: {
      login(){
        this.$store.dispatch('springLogin',this.user )
      },
    },
}
</script>

<style>
  #header .container .row-form {
    display: flex;
    align-content: flex-end;
    justify-content: end;
    padding-top: 2em;
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