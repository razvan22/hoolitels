<template>
<ul class ="Footer">
    <span v-for="icon in icons" :key="icon.image"> {{icon.image}}</span>
      <div><span id="footer-text"> @Copyright Hoolitels {{currentYear}} </span> </div>
  </ul>

</template>



<script>
export default {
    name:'Footer',
    data(){
      return{
        currentYear: new Date().getFullYear(),
        icons: [
          {image: 'Facebook'}, 
          {image:'Instagram'}, 
          {image:'Twitter'}, 

        ]
      }
    }
}
</script>

<style>
    ul{
       box-sizing: border-box;
         border: 1px solid black;
         bottom: 0;
         position: absolute;
        width: 100%;
       
    }
    span  {
      padding: 5%;
    }
  
</style>