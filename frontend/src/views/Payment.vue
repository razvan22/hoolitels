<template>
  <div class="body">
    <div class="container payment-form">
      <div class="row">
        <div class="input-field col s12">
          <input placeholder="Förnamn och efternamn" type="text" class="validate" />
          <label for="first_name">Kortinnehavare</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input placeholder="XXXX-XXXX-XXXX-XXXX" type="text" class="validate" />
          <label for="first_name">Kortnummer</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s6">
          <input placeholder="XXX/XXX" type="text" class="validate" />
          <label for="first_name">CVC</label>
        </div>
        <div class="input-field col s6">
          <input placeholder="XX/XX" type="text" class="validate" />
          <label for="first_name">Utgångsdatum</label>
        </div>
        <div class="row">
          <div class="col align-center offset-s4 offset-m5 offset-l5">
            <router-link to="/" a class="waves-effect waves-light btn cyan darken-2">Betala</router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
.payment-form {
  background: white;
  padding-top: 2vh;
}
</style>