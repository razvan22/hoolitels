<template>
  <div id="booking">
        <table class="responsive-table centered">
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
                <td>{{bookings[0].id}}</td>
                <td>{{bookings[0].start_date}} - {{bookings[1].start_date}}</td>
                <td>{{bookings[0].num_adults}}</td>
                <td>{{bookings[0].num_children}}</td>
                <td>{{bookings[0].num_infants}}</td>
                <td></td>
                <td>{{bookings[0].paid}}</td>
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
            bookings: this.$store.state.user.bookings,
        }
    },
    created(){
        console.log(this.bookings)
    }

    
}
</script>


<style scoped>
#booking{
    background: white;
}



</style>>
