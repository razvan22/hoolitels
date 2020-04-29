<template>
  <div id="logged">
    <div class="container">
        <div class="row">
          <div class="col s12 m12 l12 center">
            <i class="medium material-icons">account_box</i>
          </div>
          <div class="container">
            <div class="row">
                <h5 class="center">{{user.name}}</h5>
                <h6 class="center">{{user.email}}</h6>
            </div>
            <div class="row">
                <div class="input-field col s12 m12 l12 center">
                  <router-link to="/">
                      <button
                        class="btn waves-effect waves-light"
                        type="submit"
                        v-on:click="logout"
                        name="action">Logga Ut
                      </button>
                  </router-link>
                </div>

                <div class="col s12 m12 l12">
                  <router-link to="/userprofile" class="sidenav-close" >
                    <p class="center">Din profil </p>
                  </router-link>
                </div>
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
                name:this.$store.state.user.name,
                email: this.$store.state.user.email,
                country:this.$store.state.user.countryName,
                city:this.$store.state.user.city,
                address:this.$store.state.user.address,
                zip:this.$store.state.user.zip,
                password:'',
                confirmPassword:'',
                phone: this.$store.state.user.phone
            }
        }
    },
    methods: {
    logout(){
          this.$store.dispatch("logout")
      }
      
    }
}
</script>

<style scoped>


</style>