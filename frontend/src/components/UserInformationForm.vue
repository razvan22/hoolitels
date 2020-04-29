<template>
    <div class="user">
        <div id="user-form">
          <div class="container">
              <div class="container" id="container-bg">
                <div class="row">

                    <div class="col s12 m6 l6">
                        <div class="input-field" v-if="!ifLogged">
                            <input id="full_name" type="text" class="validate" v-model="user.name">
                            <label for="full_name">Namn</label>
                        </div>
                        <div class="input-field" v-if="ifLogged && editMode">
                             <input id="full_name" type="text" class="validate" v-model="user.name">
                            <label v-if="editMode" for="full_name"></label>
                        </div>
                        <div class="input-field" v-if="ifLogged && !editMode" >
                            <input disabled  id="disabled" type="text" class="validate center" v-model="user.name">
                            <label for="disabled"></label>
                        </div>
                    </div>

                    <div class="col s12 m6 l6" >
                        <div class="input-field" v-if="!ifLogged">
                            <input id="email" type="email" class="validate" v-model="user.email">
                            <label v-if="!ifLogged" for="email">e-post</label>
                        </div>
                        <div class="input-field" v-if="ifLogged && editMode">
                            <input id="email" type="email" class="validate" v-model="user.email">
                            <label v-if="ifLogged" for="email"></label>
                        </div>
                        <div class="input-field"  v-if="ifLogged && !editMode">
                            <input disabled  id="disabled" type="text" class="validate center" v-model="user.email">
                            <label for="disabled"></label>
                        </div>
                    </div>

                </div>

                <div class="row">

                    <div class="col s12 m6 l6">
                        <div class="input-field" v-if="!ifLogged">
                            <input id="country" type="text" class="validate" v-model="user.country">
                            <label v-if="!ifLogged" for="country">Land</label>
                        </div>
                        <div class="input-field" v-if="ifLogged && editMode">
                            <input id="country" type="text" class="validate" v-model="user.country">
                            <label v-if="ifLogged" for="country"></label>
                        </div>
                        <div class="input-field"  v-if="ifLogged && !editMode">
                            <input disabled  id="disabled" type="text" class="validate center" v-model="user.country">
                            <label for="disabled"></label>
                        </div>
                    </div>

                    <div class="col s12 m6 l6">
                        <div class="input-field" v-if="!ifLogged">
                            <input id=" city" type="text" class="validate" v-model="user.city">
                            <label v-if="!ifLogged" for="city">Stad</label>
                        </div>
                        <div class="input-field" v-if="ifLogged && editMode">
                            <input id=" city" type="text" class="validate" v-model="user.city">
                            <label v-if="ifLogged" for="city"></label>
                        </div>
                        <div class="input-field"  v-if="ifLogged && !editMode">
                            <input disabled  id="disabled" type="text" class="validate center" v-model="user.city">
                            <label for="disabled"></label>
                        </div>
                    </div>

                </div>
                <div class="row">

                        <div class="col s4 m4 l4">
                        <div class="input-field" v-if="!ifLogged">
                            <input id="zip" type="text" class="validate" v-model="user.zip">
                            <label v-if="!ifLogged" for="zip">postnummer</label>
                        </div>
                        <div class="input-field" v-if="ifLogged && editMode">
                            <input id="zip" type="text" class="validate center" v-model="user.zip">
                            <label v-if="ifLogged" for="zip"></label>
                        </div>
                        <div class="input-field"  v-if="ifLogged && !editMode">
                            <input disabled  id="disabled" type="text" class="validate center" v-model="user.zip">
                            <label for="disabled"></label>
                        </div>
                    </div>

                    <div class="col s8 m8 l8">
                        <div class="input-field" v-if="!ifLogged">
                            <input id="address" type="text" class="validate" v-model="user.address">
                            <label v-if="!ifLogged" for="address">Adress</label>
                        </div>
                        <div class="input-field" v-if="ifLogged && editMode">
                            <input id="address" type="text" class="validate center" v-model="user.address">
                            <label v-if="ifLogged" for="address"></label>
                        </div>  
                        <div class="input-field"  v-if="ifLogged && !editMode">
                            <input disabled  id="disabled" type="text" class="validate center" v-model="user.address">
                            <label for="disabled"></label>
                        </div>
                    </div>

                </div>

                <div class="row">

                    <div class="col s12 m12 l12">
                        <div class="input-field" v-if="!ifLogged">
                            <input id="telephone" type="tel" class="validate" v-model="user.phone">
                            <label v-if="!ifLogged" for="telephone">Telefonnummer</label>
                        </div>
                        <div class="input-field" v-if="ifLogged && editMode">
                            <input id="telephone" type="tel" class="validate" v-model="user.phone">
                            <label v-if="ifLogged" for="telephone"></label>
                        </div>
                        <div class="input-field"  v-if="ifLogged && !editMode">
                            <input disabled  id="disabled" type="text" class="validate center" v-model="user.phone">
                            <label for="disabled"></label>
                        </div>
                    </div>

                </div>

                <div class="row" v-if="editMode || !ifLogged">

                    <div class="col s12 m12 l12">
                        <div class="input-field" v-if="editMode">
                            <input  id="password" type="password" class="validate">
                            <label for="password">gammalt lösenord</label>
                        </div>
                    </div>

                    <div class="col s12 m12 l12">
                        <div class="input-field">
                            <input id="password" type="password" class="validate" >
                            <label for="password">lösenord</label>
                        </div>
                    </div>

                    <div class="col s12 m12 l12">
                        <div class="input-field">
                            <input id="confirm_password" type="password" class="validate">
                            <label for="confirm_password">bekräfta lösenord</label>
                        </div>
                    </div>

                </div>



            </div>

            <div class="container">
                <div class="row" id="submit-btn">
                    <div class="col">
                        <a v-if="ifLogged&&!editMode" v-on:click="editMode = true"  class=" lighten-1 btn-floating waves-effect waves-light btn-medium"><i class="material-icons">edit</i></a>
                        <button v-if="!ifLogged||editMode" v-on:click="editMode = false" class="btn-register btn-large waves-effect waves-light cyan darken-2" type="submit" name="action">Registrera
                        </button>
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
            },
            
            editMode: false
            
        }
    },
    computed:{
        getUser(){
            return this.$store.state.user
        },
        ifLogged(){
            return this.$store.state.userLogged
        }

    },

    methods:{

 
    }
    
}
</script>

<style scoped>
#disabled{
    border: 0em;
}

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

.btn-register {
     border-radius: 25px;
}
</style>