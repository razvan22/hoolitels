<template>
  <header class="blue lighten-5">
      <div class="container">
          <div class="row">
            <div class="col s8 m8 l8">
                <img src="../assets/Hoolitels.png"  alt="" class="responsive">
                <a href="">
                    <i class="medium material-icons">account_circle</i>
                </a>
            </div>
          </div>
      </div>
  </header>
</template>

<script>
export default {

}
</script>

<style>
.container{
    background-image: url("../assets/header-img.jpg");
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}
header .container{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 35em;
    max-height: 35em;
}

.container .row .col{
    display: flex;
    margin-bottom: 10em;
}
.container .row .col a{
    margin-left: 0.20em;
    color: rgba(33, 33, 51, 0.726) !important;
}
.container .row i{
    padding-top: 0.70em;
}
.container .row{
    margin:0em;
}
.responsive {
  width: 100%;
  height:auto ;
}
@media only screen and (max-width: 600px) {

}
@media only screen and (min-width: 600px) {
    
}
@media only screen and (min-width: 768px) {}
@media only screen and (min-width: 992px) {}
@media only screen and (min-width: 1200px) {}


</style>