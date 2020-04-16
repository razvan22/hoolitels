<template>

<div class="result">
 
  <div class="container">
      <Logo/>
    
              <DisplayHotelFromSearch/>
         
      <Footer/>
  </div>
 
</div>

</template>

<script>
import Logo from '@/components/Logo.vue'
import DisplayHotelFromSearch from '@/components/DisplayHotelFromSearch.vue'
import Footer from '@/components/Footer.vue'

export default {
 
    components:{
        Logo,
        Footer,
        DisplayHotelFromSearch
        
      
    }
    

}
</script>

<style>
.result{
  
    height: 100vh;
 
}

</style>