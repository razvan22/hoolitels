<template>
  <div class="login">
    <div class="container">
        <div class="row">
          <div class="col s12 m12 l12">
              <img src="../assets/logo_minimal.gif" alt=""  srcset="" class="responsive">
          </div>
      </div>
      <div class="row">
        <div class="col s12">
          <div class="input-field inline">
            <input id="email" type="email" class="validate">
            <label for="email" data-error="wrong" data-success="right">Email</label>
          </div>
        </div>
        <div class="col s12">
          <div class="input-field inline">
            <input id="password" type="password" class="validate">
            <label for="password" data-error="wrong" data-success="right">Password</label>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name:'Login'
}
</script>

<style>

 .container .row .col .input-field input[type=email]:focus + label {
     color: #000 !important;
    }
  .container .row .col .input-field input[type=password]:focus + label {
     color: #000 !important;
     }

</style>