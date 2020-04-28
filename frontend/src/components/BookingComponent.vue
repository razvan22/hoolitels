<template>
  <div id="booking" >

            <table class="responsive-table centered" v-for="booking in bookings" :key="booking.id" >
            <thead>
            <tr>
                <th>Boknings id</th>
                <th>Bokningsperiod</th>
                <th>Vuxna</th>
                <th>Barn</th>
                <th>Spädbarn</th>
                <th>Extra säng</th>
                <th>Totalbelopp</th>
            </tr>
            </thead>

            <tbody>
            <tr>
                <td>{{booking.id}}</td>
                <td>{{booking.start_date}} - {{booking.end_date}}</td>
                <td>{{booking.num_adults}}</td>
                <td>{{booking.num_children}}</td>
                <td>{{booking.num_infants}}</td>
                <td></td>
                <td>{{bookings.paid}}</td>
            </tr>
            </tbody>
        </table>
        
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
#booking{
    
    

    background: white;
}




</style>>
