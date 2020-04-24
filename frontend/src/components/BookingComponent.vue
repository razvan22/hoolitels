<template>
  <div id="booking">
      <div class="container">
          <div class="row">
                <div class="col s12 m6 l6">
                    <p class="center">
                         <em class="teal-text">Boknings id: </em>  {{bookings[1].id}}
                    </p>
                </div>
                <div class="col s12 m6 l6">
                    <p class="center">
                         <em class="teal-text">Bokningsperiod: </em>  {{bookings[1].start_date}} - {{bookings[1].start_date}}
                    </p>
                </div>
          </div>
          <div class="row">
                <div class="col s12 m6 l6">
                    <ul>
                        <li class="center"><h6 class="teal-text">Antal personer</h6></li>
                        <li class="center"><p>vuxna: {{bookings[1].num_adults}}</p></li>
                        <li class="center"><p>barn: {{bookings[1].num_children}}</p></li>
                        <li class="center"><p>spädbarn: {{bookings[1].num_infants}}</p></li>
                    </ul>
                </div>
              <div class="col">

              </div>
          </div>

        <div class="row">
            <di class="col s12 m12 l12">
                <h6>booking id:{{bookings[1]}}</h6>
            </di>
        </div>
      </div>
  </div>
</template>

<script>
export default {
    name: 'BookingComponent',
    data(){
        return{
            bookings: this.$store.state.user.bookings
        }
    },
    
}
</script>


<style scoped>
#booking .container{
    background: #eeeeee;
}
#booking .container .row {
    background: white;
    border-radius: 0.20em;
    border:solid #eeeeee 0.20em;
}


</style>>
