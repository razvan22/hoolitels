<template>
  <div class="container">
      <Header/>
       <div class="payment-form row">
          <div class="col s12">
                 <div class="input-field col s12">
                    <input placeholder="XXXX-XXXX-XXXX-XXXX"  type="text" class="validate">
                    <label for="first_name">Kortnummer</label>
                 </div>
          </div>
          <div class="row">
              <div class="col s6">
                    <div class="input-field col s12">
                    <input placeholder="XXX/XXX"  type="text" class="validate">
                    <label for="first_name">CVC</label>
                 </div>
              </div>
                   <div class="col s6">
                        <div class="input-field col s12">
                            <input placeholder="XX/XX"  type="text" class="validate">
                            <label for="first_name">Utgångsdatum</label>
                        </div>
                    </div>
                    <div class="col s12 center-align">
                              <router-link
                                to="/"
                                a class="waves-effect waves-light btn cyan darken-2"> Betala
                            </router-link>
                       
                    </div>
                </div>
        
       </div>

      <Footer/>
     
  </div>

</template>

<script>
import Footer from '../components/Footer.vue'
import Header from '../components/Header.vue'

export default {
    data(){
     
    },
    components:{
        Header,
        Footer,
    },
}
</script>


<style>
.payment-form{
    background: white;
}

</style>