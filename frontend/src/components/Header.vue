<template>
  <div class="myHeader">
    <div class="container">
      <div class="row row-1">
        <div class="col s11 m11 l11 col-login right-align">
          <router-link
            to="/login"
            class="waves-effect waves-light btn-floating cyan darken-2"
          >
            <i class="material-icons right">person</i>
          </router-link>
        </div>
      </div>
      <div class="row">
        <div class="col s12 m12 l12">
          <img src="../assets/logo_minimal.gif" alt srcset class="responsive" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
.row-1 {
  display: flex;
  justify-content: end;
}

.row .col.m12 {
  margin-top: 2em;
  display: flex;
  justify-content: space-around;
}

.myHeader .container {
  border-radius: 0.3em;
  /* margin-top: 1em;  */
  height: 15em;
  background: url("../assets/header-img.jpg");
  background-size: cover;
  background-position: center;
}

.myHeader .container .row-1 .col-login {
  margin-left: 0em;
  margin-right: 0em;
  padding: 0em;
  margin-top: 1em;
}

.myHeader .container .row-1 .sign_up {
  margin-left: 0em;
  margin-right: 0em;
  padding: 0em;
  margin-top: 1em;
}

.row .sign_up i {
  font-size: 2em;
}
.row .col-login i {
  font-size: 2em;
}

.responsive {
  width: 100%;
  max-width: 13em;
  height: auto;
}
</style>
