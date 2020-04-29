<template>
  <div id="login">
      <div class="row">
              <div class="col s12 m12 l12 center">
                <img src="../assets/logo_minimal.gif" class="responsive" />
              </div>
              <div class="container">
                <div class="row">
                  <div class="input-field col s12 m12 l12">
                    <h5>Logga in</h5>
                  </div>
                </div>
                <div class="row">
                  <div class="input-field col s12 m12 l12">
                    <label for="username">E-post</label>
                    <input
                      id="username"
                      type="text"
                      class="validate"
                      v-model="user.email"
                    />
                  </div>
                  <div class="input-field col s12 m12 l12">
                    <label for="password" class="validate">Lösenord</label>
                    <input id="password" type="password" v-model="user.password" />
                  </div>
                  <div class="input-field col s12 m12 l12">
                      <router-link to="/userprofile">
                          <a
                            class="button-log-in waves-effect waves-light btn-small cyan darken-2 rounded-btn"
                            type="submit"
                            v-on:click="login()"
                            name="action">Logga in
                        </a>
                      </router-link>
                  </div>
                  <div class="col s12 m12 l12">
                    <router-link to="/signup"
                      ><p>Skapa konto</p></router-link>
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

<style scoped>
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
  #login .row .responsive {
    width: 70%;
    height: auto;
  }

  #header .container .row i {
    font-size: 4em;
    color: #006064;
  }
  .button-log-in{
      border-radius: 25px;
  }
</style>