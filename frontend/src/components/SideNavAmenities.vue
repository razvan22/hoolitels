<template>
<div class="row">
  <div class="drawer col l2">
      <span>Bekvämligeheter:</span>
      <p>
      <label>
        <input type="checkbox" class="filled-in" checked="checked" />
        <span>Filled in</span>
      </label>
        </p>

        <p v-for="a in hotel.amenities" :key="a.id">
        </p>
     
  </div>
</div>
</template>

<script>
import M from 'materialize-css/dist/js/materialize.js'
export default {
      data() {
    return {};
    },
    props: [`hotel`],
    mounted(){
    let elems = document.querySelectorAll('.sidenavResult');
    M.Sidenav.init(elems);


    }

}
</script>

<style>
.drawer{
  width: 95%;
  margin-top: 0.6em;
  background-color: #f0f0f0;
  border: 0.03em solid black;

border-radius: 10px;

  
   
}


</style>