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
                <td>{{bookings[0].paid}}</td>
            </tr>
            <tr>
                <td>Alan</td>
                <td>Jellybean</td>
                <td>$3.76</td>
            </tr>
            <tr>
                <td>Jonathan</td>
                <td>Lollipop</td>
                <td>$7.00</td>
            </tr>
            </tbody>
        </table>
        
        <h6>booking id:{{bookings}}</h6>
        
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
    mounted(){
        console.log(this.$store.state.user.bookings)
    }
    
}
</script>


<style scoped>
#booking{
    background: white;
}



</style>>
