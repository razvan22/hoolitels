<template>
<body>
    <header>
        <div class="container">
            <div class="row row-1">
                <div class="col s4 m2 l2 sign_up">
                    <router-link to="/signup" class="waves-effect waves-light btn-small blue-grey darken-4">Register
                        <i class="material-icons right">person_add</i>
                    </router-link>
                </div>
                <div class="col s4 m2 l2 col-login">
                    <router-link to="/login" class="waves-effect waves-light btn-small blue-grey darken-4">Sign in
                        <i class="material-icons right">person</i>
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
        <router-link to="/result" class="waves-effect waves-light btn-small blue-grey darken-4">Sök
            <i class="material-icons right">search</i>
        </router-link>
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
.row-1{
    display: flex;
    justify-content: end;


}
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
    margin-left: 0em;
    margin-right: 0em;
    padding: 0em;
    margin-top: 1em;
}

header .container .row-1 .sign_up{
    margin-left: 0em;
    margin-right: 0em;
    padding: 0em;
    margin-top: 1em;
}
.row .sign_up  i{
    font-size: 2em;
}
.row .col-login  i{
    font-size: 2em;
}   

.responsive {
  width: 100%;
  max-width: 41em;
  height: auto;
}
                  



</style>
