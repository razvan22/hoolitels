<template>
  <div class="login">
    <div class="container">
      <Logo/>
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
        <div class="col s12">
            <button class="btn waves-effect waves-light  blue darken-3" type="submit" name="action">LOGIN
            </button>
        </div>
      </div>
      <div class="row row-signup">
         <a href="">Don't have an account ? Sign up here</a>
      </div>
    </div>
  </div>
</template>

<script>
import Logo from '@/components/Logo.vue'

export default {
  name:'Login',
  components:{
    Logo
  }
}
</script>

<style>

 .container .row .col .input-field input[type=email]:focus + label {
     color: #000 !important;
    }
  .container .row .col .input-field input[type=password]:focus + label {
     color: #000 !important;
    }

  .container .row-signup{
    margin-top: 7em;
  }

</style>