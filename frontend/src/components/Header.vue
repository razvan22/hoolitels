<template>
  <div class="Header">    
      <div class="row">
          <router-link to="/" class="col s6 m6 l6">
          <img src="../assets/logo_minimal.gif" alt srcset class="responsive" />
        </router-link>
        <div class="col s5 m5 l5 col-login right-align">
          <router-link
            to="/login"
            class="waves-effect waves-light btn-floating cyan darken-2"
          >
            <i class="material-icons right">person</i>
          </router-link>
        </div>
      </div>
    
    </div>
  
</template>

<script>
export default {};
</script>

<style scoped>

.col-login {
  border-radius: 5em;
  margin: 20px;
}

.responsive {
  margin-top: 20px;
  width: 100%;
  max-width: 10em;
  height: auto;
}
</style>
