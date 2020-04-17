<template>
  <div class="container hotel-from-search">
        <!-- <div class="row">
    <div class="col s12 m12 l12">
      <div class="card">
        <div class="card-image">
          <img src="https://static.thatsup.co/content/img/article/15/jul/guiden-till-prisvarda-hotell-i-stockholm.jpg">
          <span class="card-title">{{hotel.name}}</span>
        </div>
        <div class="card-content " >
           <p>
              <ul>
                <li v-for="a in hotel.amenities" :key="a.id">{{a.name}}</li>
            </ul>
           </p>
        </div>
        <div class="card-action">
          <a href="#">link to hotel vy</a>
        </div>
      </div>
    </div>
  </div> -->

    <div class="card" >
      <div class="card-image">
        <img src="https://static.thatsup.co/content/img/article/15/jul/guiden-till-prisvarda-hotell-i-stockholm.jpg">
        <span class="card-title">{{hotel.name}}</span>
      </div>
      <div class="card-content">
          <ul class="collection">
            <li class="collection-item" v-for="a in hotel.amenities" :key="a.id">{{a.name}}</li>
          </ul>
      </div>
      <div class="card-action">
           <a href="#">This is a link</a>
      </div>
    </div>
       
  </div>
</template>

<script>

export default {
    name: 'DisplayHotelFromSearch',
    props: [`hotel`],
    data(){
      return{
        amenities:[
          {
          name:'this',
          id:0
        },
          {
          name:'second',
          id:2
        }
        ]
      }
    }
    ,
    mounted(){
      //  let h = document.querySelectorAll('.hotel-from-search');
    
        
    }

}
</script>

<style>

</style>
