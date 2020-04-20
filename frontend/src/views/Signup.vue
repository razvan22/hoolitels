<template>
    <div class="signup">
        <div id="signup-form">
            <div class="row">
                <div class="col s12 m6 l6">
                    <div class="input-field">
                        <input id="full_name" type="text" class="validate">
                        <label for="full_name">Full Name</label>
                    </div>
                </div>
                <div class="col s12 m6 l6">
                     <div class="input-field">
                        <input id="email" type="email" class="validate">
                        <label for="email">Email</label>
                     </div>
                </div>
            </div>
            <div class="row">
                <div class="col s12 m6 l6">
                       <div class="input-field">
                        <input id="country" type="text" class="validate">
                        <label for="country">Country</label>
                     </div>
                </div>
                <div class="col s12 m6 l6">
                    <div class="input-field">
                        <input id=" city" type="text" class="validate">
                        <label for=" city">City</label>
                    </div>
                </div>
            </div>
             <div class="row">
                <div class="col s12 m9 l9">
                       <div class="input-field">
                        <input id="address" type="text" class="validate">
                        <label for="address">Address</label>
                     </div>
                </div>
                <div class="col s12 m3 l3">
                    <div class="input-field">
                        <input id="zip" type="text" class="validate">
                        <label for="zip">Zip</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col s12 m6 l6">
                    <div class="input-field">
                        <input id="password" type="password" class="validate">
                        <label for="password">Password</label>
                    </div>
                </div>
                <div class="col s12 m6 l6">
                    <div class="input-field">
                        <input id="confirm_password" type="password" class="validate">
                        <label for="confirm_password">Confirm Password</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="input-field">
                    <input id="telephone" type="tel" class="validate">
                    <label for="telephone">Phone</label>
                </div>
            </div>
        </div>
    </div>
</template>





<script>

export default {
    name:'Signup',

    components:{
    },
    data(){
        return{
            user:{
                name:'',
                email: '',
                country:'',
                city:'',
                address:'',
                zip:'',
                password:'',
                confirmPassword:''
            }
        }
    },
    mounted(){
        this.getUser();
    },
    methods:{
        getUser: function(){
            console.log("SignUp")
        }
    }
    
}
</script>

<style>
#signup-form{
    display: flex;
    flex-direction: column;
}
</style>