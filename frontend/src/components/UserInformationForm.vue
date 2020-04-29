<template>
  <div class="container" id="container-bg">
    <div class="row">
      <div class="col s12">
        <h4 id="create-account">Skapa ett konto</h4>
      </div>
      <div class="col s12 m6 l12">
        <div class="input-field" v-if="!ifLogged">
          <input id="full_name" type="text" class="validate" v-model="user.name" />
          <label for="full_name">Namn</label>
        </div>
        <div class="input-field" v-if="ifLogged && editMode">
          <input id="full_name" type="text" class="validate" v-model="user.name" />
          <label v-if="editMode" for="full_name"></label>
        </div>
        <div class="input-field" v-if="ifLogged && !editMode">
          <input disabled id="disabled" type="text" class="validate center" v-model="user.name" />
          <label for="disabled"></label>
        </div>
      </div>
      <div class="col s12 m6 l12">
        <div class="input-field" v-if="!ifLogged">
          <input id="email" type="email" class="validate" v-model="user.email" />
          <label v-if="!ifLogged" for="email">E-post</label>
        </div>
        <div class="input-field" v-if="ifLogged && editMode">
          <input id="email" type="email" class="validate" v-model="user.email" />
          <label v-if="ifLogged" for="email"></label>
        </div>
        <div class="input-field" v-if="ifLogged && !editMode">
          <input disabled id="disabled" type="text" class="validate center" v-model="user.email" />
          <label for="disabled"></label>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col s12 m12 l12">
        <div class="input-field" v-if="!ifLogged">
          <input id="address" type="text" class="validate" v-model="user.address" />
          <label v-if="!ifLogged" for="address">Adress</label>
        </div>
        <div class="input-field" v-if="ifLogged && editMode">
          <input id="address" type="text" class="validate center" v-model="user.address" />
          <label v-if="ifLogged" for="address"></label>
        </div>
        <div class="input-field" v-if="ifLogged && !editMode">
          <input disabled id="disabled" type="text" class="validate center" v-model="user.address" />
          <label for="disabled"></label>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col s4 m4 l4">
        <div class="input-field" v-if="!ifLogged">
          <input id="zip" type="text" class="validate" v-model="user.zip" />
          <label v-if="!ifLogged" for="zip">Postnummer</label>
        </div>
        <div class="input-field" v-if="ifLogged && editMode">
          <input id="country" type="text" class="validate" />
          <label v-if="ifLogged" for="country">{{getUserCountry}}</label>
        </div>
        <div class="input-field" v-if="ifLogged && !editMode">
          <input disabled id="disabled" type="text" class="validate center" />
          <label for="disabled">{{getUserCountry}}</label>
        </div>
      </div>

      <div class="row">
        <div class="col s8 m8 l8">
          <div class="input-field" v-if="!ifLogged">
            <input id="city" type="text" class="validate" v-model="user.city" />
            <label v-if="!ifLogged" for="city">Postort</label>
          </div>
          <div class="input-field" v-if="ifLogged && editMode">
            <input id=" city" type="text" class="validate" v-model="user.city" />
            <label v-if="ifLogged" for="city"></label>
          </div>
          <div class="input-field" v-if="ifLogged && !editMode">
            <input disabled id="disabled" type="text" class="validate center" v-model="user.city" />
            <label for="disabled"></label>
          </div>
        </div>
        <div class="row">
          <div class="col s12">
            <div class="input-field" v-if="!ifLogged">
              <select v-model="selectedCountry">
                <option value disabled selected>Välj ditt land</option>
                <option v-for="country in countries" :key="country.id">{{country.name}}</option>
              </select>
              <!-- <input id="country" type="text" class="validate" v-model="user.country">
              <label v-if="!ifLogged" for="country">Land</label>-->
            </div>
            <div class="input-field" v-if="ifLogged && editMode">
              <input id="country" type="text" class="validate" />
              <label v-if="ifLogged" for="country">{{getUserCountry}}</label>
            </div>
            <div class="input-field" v-if="ifLogged && !editMode">
              <input disabled id="disabled" type="text" class="validate center" />
              <label for="disabled">{{getUserCountry}}</label>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col s12">
            <div class="input-field" v-if="!ifLogged">
              <input id="telephone" type="tel" class="validate" v-model="user.phone" />
              <label v-if="!ifLogged" for="telephone">Telefonnummer</label>
            </div>
            <div class="input-field" v-if="ifLogged && editMode">
              <input id="telephone" type="tel" class="validate" v-model="user.phone" />
              <label v-if="ifLogged" for="telephone"></label>
            </div>
            <div class="input-field" v-if="ifLogged && !editMode">
              <input
                disabled
                id="disabled"
                type="text"
                class="validate center"
                v-model="user.phone"
              />
              <label for="disabled"></label>
            </div>
          </div>
        </div>
        <div class="row" v-if="editMode || !ifLogged">
          <div class="col s12">
            <div class="input-field" v-if="editMode">
              <input id="password" type="password" class="validate" />
              <label for="password">Gammalt lösenord</label>
            </div>
          </div>
          <div class="col s12">
            <div class="input-field">
              <input id="password" type="password" class="validate" />
              <label for="password">Ange lösenord</label>
            </div>
          </div>
          <div class="col s12">
            <div class="input-field">
              <input id="confirm_password" type="password" class="validate" />
              <label for="confirm_password">Bekräfta lösenord</label>
            </div>
          </div>
        </div>
        <div class="row" id="submit-btn">
          <div class="col">
            <a
              v-if="ifLogged&&!editMode"
              v-on:click="editMode = true"
              class="btn-register light-blue lighten-1 btn-floating waves-effect waves-light btn-medium cyan darken-2"
            >
              <i class="material-icons">edit</i>
            </a>
            <button
              v-if="editMode"
              v-on:click="editMode = false"
              class="btn-large waves-effect waves-light"
              type="submit"
              name="action"
            >Spara</button>
            <button
              v-if="!ifLogged"
              v-on:click="editMode = false"
              class="btn-register btn-large waves-effect waves-light cyan darken-2"
              type="submit"
              name="action"
            >Skapa konto</button>
          </div>
        </div>
      </div>
    </div>
    <div>
      <modal name="successful" :height="150" :width="500" :border-radius="200">
        <div id="promp">
          <h5 class="center">Ett konto har skapats med e-post</h5>
          <h6 class="center">{{user.email}}</h6>
          <div class="center">
            <router-link to="/">
              <button
                class="btn-register-2 btn-small waves-effect waves-light cyan darken-2"
                name="action"
              >Ok</button>
            </router-link>
          </div>
        </div>
      </modal>
      <modal name="failed" :height="150" :width="500" :border-radius="200">
        <div id="promp">
          <h5 class="center red-text">Registrering misslyckades !!!</h5>

          <div class="center">
            <button
              @click="hide"
              class="btn-register-2 btn-small waves-effect waves-light cyan darken-2"
              name="action"
            >Ok</button>
          </div>
        </div>
      </modal>
    </div>
  </div>
</template>
<script>
import M from "materialize-css/dist/js/materialize.js";
export default {
  name: "UserInformationForm",

  data() {
    return {
      user: {
        name: this.$store.state.user.name,
        email: this.$store.state.user.email,
        country_id: this.$store.state.user.country_id,
        city: this.$store.state.user.city,
        address: this.$store.state.user.address,
        zip: this.$store.state.user.zip,
        password: "",
        phone: this.$store.state.user.phone
      },
      editMode: false,
      countries: this.$store.state.countries
    };
  },
  computed: {
    getUserCountry() {
      let fIndex = this.countries.findIndex(e => {
        return e.id === this.user.country_id;
      });
      if (fIndex > -1) {
        return this.countries[fIndex].name;
      } else {
        return "";
      }
    },
    getUser() {
      return this.$store.state.user;
    },
    ifLogged() {
      return this.$store.state.userLogged;
    }
  },
  mounted() {
    this.$store.dispatch("isUserLogged");
    this.$store.dispatch("getCountries");
    let countrySelector = document.querySelectorAll("select");
    M.FormSelect.init(countrySelector);
  },

  methods: {
    addUser: async function() {
      let rawResponse = await fetch("http://localhost:8070/rest/user", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Accept-Encoding": "gzip, deflate, br"
        },
        body: JSON.stringify(this.user)
      });
      if (rawResponse.status == 200) {
        this.successfulShow();
      } else {
        this.failedShow();
      }
      let response = await rawResponse.json();
      console.log(response);
    },

    successfulShow() {
      this.$modal.show("successful");
    },

    failedShow() {
      this.$modal.show("failed");
    },

    hide() {
      this.$modal.hide("failed");
    }
  }
};
</script>

<style scoped>
#promp {
}

#disabled {
  border: 0em;
}

.user {
  padding-top: 5em;
}
#submit-btn {
  display: flex;
  align-items: center;
  justify-content: center;
}
#container-bg {
  background: white;
}
#create-account {
  display: flex;
  align-items: center;
  justify-content: center;
}
.btn-register {
  border-radius: 25px;
}
#promp h6 {
  color: #424242;
}
.btn-register-2 {
  margin-top: 3vh;
  border-radius: 10px;
  width: 100px;
}
</style>