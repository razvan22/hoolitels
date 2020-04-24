<template>
<div>
    <div class="row" id="nav">
        <div class="col left"><router-link to="/signup">
            <a v-on:click="editUserInfo" class="light-blue lighten-1 btn-floating waves-effect waves-light btn-medium"><i class="material-icons">edit</i></a></router-link></div>
        <div class="col right"><a class="red btn-floating waves-light btn"><i class="material-icons">logout</i></a></div>
        <div class="col right">
            <router-link to="/">
                <a class="teal lighten-1 btn-floating waves-effect waves-light btn-medium" v-on:click="headerState()">
                    <i class="material-icons">home</i>
                </a>
            </router-link>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col s12 m12 l12" id="profile">
                <img src="../assets/logo_minimal.gif">
            </div>
            <div class="col s12 m12 l12" id="userName">
                <h3 class="">{{currentUser.name}}</h3>
                <h5 class="">{{currentUser.email}}</h5>
                <h5 class="">{{currentUser.city}} {{currentUser.address}} {{currentUser.zip}}</h5>
                <h5>{{currentUser.phone}}</h5>
            </div>
            <div class="col">
                <booking-componet></booking-componet>
            </div>
        </div>
        
    </div>
</div>
</template>

<script>
import BookingComponet from  '../components/BookingComponent.vue'
export default {
    components:{
        BookingComponet
    },
    computed:{
        currentUser(){
            return this.$store.state.user
        }
    },
    methods:{
        headerState(){
           this.$store.state.headerDisabled = false;
        },
        editUserInfo(){
            this.$store.state.disable.editUserInfo = true;
        }
    }
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
body #profile{
    display: flex;
    align-items: center;
    justify-content: center;
}

</style>
