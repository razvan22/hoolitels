<template>
<div>
    <div class="row" id="nav">
        <div class="col left"><a class="btn-floating waves-effect waves-light btn-medium"><i class="material-icons">edit</i></a></div>
        <div class="col right"><a class="btn-floating waves-light btn"><i class="material-icons">logout</i></a></div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col s12 m12 l12" id="profile">
                <img src="../assets/logo_minimal.gif">
            </div>
            <div class="col s12 m12 l12" id="userName">
                <h3>User Name</h3>
                <h5>email</h5>
            </div>
        </div>
    </div>
</div>
</template>

<script>
export default {
    data(){
        return{
             user:{
                name:'Johnny Bravo',
                email: 'johhny@.com',
                country:'',
                city:'',
                address:'',
                zip:'',
                password:'',
                confirmPassword:'',
                phone:''
            }
        }
    },
    mounted(){
        this.getUser()
    },
    methods:{
        logoutUser:function(){
            prompt("Do you want to log out?")
        }
        ,
        getUser: async function(){
            // let rawResponse = await fetch('http://localhost:8070/rest/user/');
            // let response = await rawResponse.json();
            // console.log(response)
        } 
    }

}
</script>

<style scoped>
div #nav{
    padding-top: 2vh ,2vh,;
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
