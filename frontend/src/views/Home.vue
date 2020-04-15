<template>
<body>
    <header>
        <div class="container">
            <div class="row row-1">
                <div class="col s8 m10 l10"></div>
                <div class="col s4 m2 l2 col-login">
                    <router-link to="/login" class="btn-floating btn-large waves-effect waves-light blue-grey darken-3">
                        <i class="large material-icons">account_circle</i>
                    </router-link>
                </div>
            </div>
            <div class="row">
                <div class="col s12 m12 l12">
                    <img src="../assets/logo_minimal.gif" alt=""  srcset="" class="responsive">
                </div>
            </div>
        </div>
    </header>
    <section class="main">
        <SearchHotel/>
    </section>
    <Footer/>
</body>
</template>

<script>
import Footer from '@/components/Footer.vue'
import SearchHotel from '@/components/SearchHotel.vue'


export default {
    name: 'Home',
    components: {
        Footer,
        SearchHotel, 
      
        
    }
}
</script>

<style>
header .container {
border-radius: 0.30em;
/* margin-top: 1em;  */
height: 35em;
background: url('../assets/header-img.jpg');
background-size: cover;
background-position: center;
}

.row .col.m12 {
margin-top: 2em;
display: flex;
justify-content: space-around;
}

header .container .row-1 .col-login{
margin-top: 1em;
}

.row .col-login i{
    font-size: 3.50em;
}   

.responsive {
  width: 100%;
  max-width: 41em;
  height: auto;
}
                  



</style>
