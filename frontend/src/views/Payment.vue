<template>
  <div class="body">
     

      <div id="modal1" class="modal">
    <div class="modal-content">
      <h5 class="center-align">Vi har tagit emot din betalning</h5>
      <p class="center-align">Tack för din bokning </p>
    </div>
    <div class="modal-footer center-align">
      <a href="/" class="modal-close waves-effect waves-green btn-flat">Ta mig till startsidan</a>
    </div>
  </div>
    



    <div class="container payment-form">
      <div class="row">
        <div class="input-field col s12">
          <input placeholder="Förnamn och efternamn" type="text" class="validate" id="first_name" required="" aria-required="true" />
          <label for="first_name" class="active">Kortinnehavare</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input placeholder="XXXX-XXXX-XXXX-XXXX" type="number" class="validate" id="card_number" required="" aria-required="true" />
          <label for="card_number" class="active">Kortnummer</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s6">
          <input placeholder="XXX" type="number" class="validate" id="cvc" required="" aria-required="true" />
          <label for="cvc" class="active">CVC</label>
        </div>
        <div class="input-field col s6">
          <input placeholder="XX/XX" type="number" class="validate" id="expiration_date" required="" aria-required="true" />
          <label for="expiration_date" class="active">Utgångsdatum</label>
        </div>
        <div class="row">
          <div class="col align-center offset-s4 offset-m5 offset-l5">
             <a class="btn-payment waves-effect waves-light btn modal-trigger  cyan darken-2" href="#modal1">Betala </a>
          </div>
        </div>
      </div>
    </div>
  </div>

  
</template>

<script>
import M from 'materialize-css'

export default{
  mounted(){
    let elems = document.querySelectorAll('.modal');
    M.Modal.init(elems);
    
  },

};



</script>

<style scoped>
.payment-form {
  background: white;
  padding-top: 2vh;
}
.btn-payment{
   border-radius: 25px;
}
</style>