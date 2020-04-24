<template>
    <div class="user">
        <div id="user-form">
          <div class="container">
              <div class="container" id="container-bg">
                    <div class="row">
                    <div class="col s12 m12 l12">
                        <div class="input-field">
                            <input id="full_name" type="text" class="validate" v-model="user.name">
                            <label v-if="!editMode" for="full_name">Full Name</label>
                            <label v-if="editMode" for="full_name"></label>
                        </div>
                    </div>
                    <div class="col s12 m12 l12" v-if='!editMode'>
                        <div class="input-field">
                            <input id="email" type="email" class="validate" v-model="user.email">
                            <label v-if="!editMode" for="email">Email</label>
                            <label v-if="editMode" for="email"></label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 m6 l6">
                        <div class="input-field">
                            <input id="country" type="text" class="validate" v-model="user.country">
                            <label v-if="!editMode" for="country">Country</label>
                            <label v-if="editMode" for="country"></label>
                        </div>
                    </div>
                    <div class="col s12 m6 l6">
                        <div class="input-field">
                            <input id=" city" type="text" class="validate" v-model="user.city">
                            <label v-if="!editMode" for="city">City</label>
                            <label v-if="editMod" for="city"></label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 m9 l9">
                        <div class="input-field">
                            <input id="address" type="text" class="validate" v-model="user.address">
                            <label v-if="!editMode" for="address">Address</label>
                            <label v-if="editMode" for="address"></label>
                        </div>
                    </div>
                    <div class="col s12 m3 l3">
                        <div class="input-field">
                            <input id="zip" type="text" class="validate" v-model="user.zip">
                            <label v-if="!editMode" for="zip">Zip</label>
                            <label v-if="editMode" for="zip"></label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div v-if="editMode" class="col s12 m12 l12">
                        <div class="input-field">
                            <input id="password" type="password" class="validate" v-model="user.password">
                            <label for="password">gammalt lösenord</label>
                        </div>
                    </div>
                    <div class="col s12 m12 l12">
                        <div class="input-field">
                            <input id="password" type="password" class="validate" v-model="user.password">
                            <label for="password">lösenord</label>
                        </div>
                    </div>
                    <div class="col s12 m12 l12">
                        <div class="input-field">
                            <input id="confirm_password" type="password" class="validate" v-model="user.confirmPassword">
                            <label for="confirm_password">bekräfta lösenord</label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 m12 l12">
                            <div class="input-field">
                                <input id="telephone" type="tel" class="validate" v-model="user.phone">
                                <label v-if="!editMode" for="telephone">Phone</label>
                                <label v-if="editMode" for="telephone"></label>
                            </div>
                    </div>
                    <div class="col s12 m12 l12">
                      
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row" id="submit-btn">
                    <div class="col">
                        <router-link to="userprofile">
                            <button v-on:click='consoleLogForm()' class="btn-large waves-effect waves-light" type="submit" name="action">Submit
                                <i class="material-icons right">send</i>
                            </button>
                        </router-link>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</template>





<script>

export default {
    name:'UserInformationForm',

    data(){
        return{
            user:{
                name:this.$store.state.user.name,
                email: this.$store.state.user.email,
                country:this.$store.state.user.country,
                city:this.$store.state.user.city,
                address:this.$store.state.user.address,
                zip:this.$store.state.user.zip,
                password:'',
                confirmPassword:'',
                phone: this.$store.state.user.phone
            }
        }
    },
    computed:{
        editMode(){
            return this.$store.state.userLogged
        },
    },
    mounted(){
        
    },

    methods:{
    }
    
}
</script>

<style scoped>
.user{
    padding-top: 5em;
}
.container #submit-btn{
    margin-top: 4em;
    display: flex;
    align-items: center;
    justify-content: center;;

}
#user-form #container-bg{
    display: flex;
    flex-direction: column;
    border-radius: 1em;
    background: white;
}

#user-form{
    display: flex;
    flex-direction: column;
}
</style>