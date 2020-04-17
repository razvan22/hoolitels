<template>
  <div class="container">
        <div class="row">
    <div class="col s12 m12 l12">
      <div class="card">
        <div class="card-image">
          <img src="https://static.thatsup.co/content/img/article/15/jul/guiden-till-prisvarda-hotell-i-stockholm.jpg">
          <span class="card-title">{{hotel.name}}</span>
        </div>
        <div class="card-content " >
          <div>
            <ul class="browser-default">
              <li v-for="a in hotel.amenities" :key="a.id">{{a.name}}</li>
          
          </ul>
          </div>
        </div>
        <div class="card-action">
          <a href="#">link to hotel vy</a>
        </div>
      </div>
    </div>
  </div>
       
  </div>
</template>

<script>
export default {
    name: 'DisplayHotelFromSearch',
    props: [`hotel`]

}
</script>

<style>

</style>
