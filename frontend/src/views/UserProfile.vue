<template>
<body>
    <div class="icons-row">
       <div class="row" id="icons">
         <router-link to="/signup"><div class="col s2 m1 l1 edit"><i class="waves-effect waves-teal medium material-icons">edit</i><h5>Edit</h5></div></router-link>
           <div class="col s2 m1 l1 logout"><i class="medium material-icons">logout</i></div>
       </div>
   </div>
    <div class="container">
        <div class="row">
            <div class="col s12 m12 l12" id="profile">
                <img src="../assets/logo_minimal.gif">
            </div>
            <div class="col s12 m12 l12" id="userName">
                <h3 v-bind='user.name'>{{user.name}}</h3>
            </div>
        </div>
    </div>
</body>
</template>

<script>
export default {
    data(){
        return{
             user:{
                name:'Johnny Bravo',
                email: '',
                country:'',
                city:'',
                address:'',
                zip:'',
                password:'',
                confirmPassword:'',
                phone:''
            }
        }
    }

}
</script>

<style scoped>
a{
    color: black;
}
img{
    width: 60%;
    height: auto;
}
body #userName{
    display: flex;
    justify-content: center;
}
body #profile{
    display: flex;
    justify-content: center;
}


.icons-row{
    margin-top: 5vh;
}
.icons-row #icons{
    display: flex;
}
.icons-row .row .logout{
    margin-right: 3vw;
}


.icons-row .row .edit{
    margin-left: 3vw;
    align-items: flex-start;
}
</style>
