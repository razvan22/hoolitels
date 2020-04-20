<template>
    <div class="signup">
        <Header/>
        <div id="signup-form">
          <div class="container">
              <div class="container" id="container-bg">
                    <div class="row">
                    <div class="col s12 m12 l12">
                        <div class="input-field">
                            <input id="full_name" type="text" class="validate">
                            <label for="full_name">Full Name</label>
                        </div>
                    </div>
                    <div class="col s12 m12 l12">
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
                    <div class="col s12 m12 l12">
                        <div class="input-field">
                            <input id="password" type="password" class="validate">
                            <label for="password">Password</label>
                        </div>
                    </div>
                    <div class="col s12 m12 l12">
                        <div class="input-field">
                            <input id="confirm_password" type="password" class="validate">
                            <label for="confirm_password">Confirm Password</label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 m12 l12">
                            <div class="input-field">
                                <input id="telephone" type="tel" class="validate">
                                <label for="telephone">Phone</label>
                            </div>
                    </div>
                    <div class="col s12 m12 l12">
                      
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row" id="submit-btn">
                    <div class="col">
                        <button class="btn-large waves-effect waves-light" type="submit" name="action">Submit
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <Footer/>
    </div>
</template>





<script>
import Footer from '../components/Footer.vue'
import Header from '../components/Header.vue'

export default {
    name:'Signup',

    components:{
        Footer,
        Header
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

<style scoped>
.container #submit-btn{
    margin-top: 4em;
    display: flex;
    align-items: center;
    justify-content: center;;

}
#signup-form #container-bg{
    display: flex;
    flex-direction: column;
    border-radius: 1em;
    background: white;
}

#signup-form{
    display: flex;
    flex-direction: column;
}
</style>