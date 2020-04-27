<template>
<div>

    <div class="container">
        <div class="row">
            <UserInformationForm/>
                

            <div class="col s12 m12 l12">
                <booking-componet></booking-componet>
            </div>
        </div>
        
    </div>
</div>
</template>

<script>
import UserInformationForm from '../components/UserInformationForm'
import BookingComponet from  '../components/BookingComponent.vue'
export default {
    components:{
        BookingComponet,
        UserInformationForm
    },
    computed:{
        currentUser(){
            return this.$store.state.user
        }
    },
    methods:{
        editUserInfo(){
            this.$store.state.disable.editUserInfo = false;
        }
    },
  
}
</script>

<style scoped>
div #nav{
    padding: 3vh 2vw 0vh 2vw;
}

img{
    width: 40%;
    height: auto;
}

body #userName{
    flex-direction: column;
    display: flex;
    justify-content: center;
    align-items: center;
}

</style>
