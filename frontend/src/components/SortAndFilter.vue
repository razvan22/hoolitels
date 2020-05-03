<template>
  <div class="container">
    <div class="row">
      <div class="sort-and-filter col s12">
        <div class="nav-wrapper col s12 center-align">
          <a href="#" data-target="mobile-demo-1" class="sidenav-trigger"
            ><div>
              <a class="waves-effect waves-light btn cyan darken-2 rounded-btn"
                >Filtrera och sortera</a
              >
            </div></a
          >
        </div>
      </div>
    </div>
    <ul class="sidenav" id="mobile-demo-1">
      <ul>
        <h5 id="heading-filter-and-sort" class="center-align">
          Hitta rätt hotell för dig
        </h5>
        <li><h6 class="small-margin-left">Filtrera</h6></li>
        <label v-for="a in $store.state.amenities" :key="a.id">
          <p class="small-margin-left">
            <input
              type="checkbox"
              :id="a.id"
              :value="a.id"
              v-model="sortFilter.checkedFiltration"
            />
            <span> {{ a.name }}</span>
          </p>
        </label>
        <li class="input-field small-margin-left">
          <div class="row">
            <div class="dist-to col s6">
              <label for="dist_to_beach">Avstånd till strand (m)</label>
              <select
                v-model="sortFilter.dist_to_beach"
                name="dist_to_beach"
                class="browser-default"
              >
                <option :value="undefined" style="display:none"
                  >Välj avstånd</option
                >
                <option v-for="n in 6" :key="n" :value="n * 500">{{
                  n * 500
                }}</option>
              </select>
            </div>
            <div class="dist-to col s6">
              <label for="dist_to_town">Avstånd till centrum (m)</label>
              <select
                v-model="sortFilter.dist_to_town"
                name="dist_to_town"
                class="browser-default"
              >
                <option :value="undefined" selected>Välj avstånd</option>
                <option v-for="n in 6" :key="n" :value="n * 500">{{
                  n * 500
                }}</option>
              </select>
            </div>
          </div>
        </li>
        <li><div class="divider"></div></li>
        <li><h6 class="small-margin-left">Sortera</h6></li>
        <form action="#">
          <p class="small-margin-left">
            <label>
              <input
                class="with-gap"
                name="group1"
                type="radio"
                id="price-low-hi"
                value="10"
                v-model="sortFilter.sortMode"
              />
              <span>Pris (lägst till högst)</span>
            </label>
          </p>
          <p class="small-margin-left">
            <label>
              <input
                class="with-gap"
                name="group1"
                type="radio"
                id="price-hi-low"
                value="20"
                v-model="sortFilter.sortMode"
              />
              <span>Pris (högst till lägst)</span>
            </label>
          </p>
          <p class="small-margin-left">
            <label>
              <input
                class="with-gap"
                name="group1"
                type="radio"
                id="review-low-hi"
                value="30"
                v-model="sortFilter.sortMode"
              />
              <span>Omdöme (lägst till högst )</span>
            </label>
          </p>
          <p class="small-margin-left">
            <label>
              <input
                class="with-gap"
                name="group1"
                type="radio"
                v-model="sortFilter.sortMode"
                id="review-hi-low"
                value="40"
              />
              <span>Omdöme (högst till lägst)</span>
            </label>
          </p>
          <li>
            <a
              class="waves-effect waves-light btn-small cyan darken-2 rounded-btn"
              v-on:click="uncheckAll()"
              >Återställ</a
            >
          </li>
          <li>
            <a
              class="waves-effect waves-light btn-small cyan darken-2 rounded-btn sidenav-close"
              v-on:click="sortAndFilter()"
              >Tillämpa</a
            >
          </li>
        </form>
      </ul>
    </ul>
  </div>
</template>

<script>
import M from "materialize-css";
// import { bus } from "../main";

export default {
  name: "SortAndFilter",
  props: [`hotel`],
  data() {
    return {
      sortFilter: {
        sortMode: "10",
        checkedFiltration: [],
        dist_to_town: undefined,
        dist_to_beach: undefined,
      },
    };
  },
  methods: {
    uncheckAll: function() {
      this.sortFilter.sortMode = "10";
      this.sortFilter.checkedFiltration = [];
      this.sortFilter.dist_to_beach = undefined;
      this.sortFilter.dist_to_town = undefined;
    },
    sortAndFilter: function() {
      this.$store.commit("setSortFilter", this.sortFilter);
      this.$store.commit("filterHotels");
    },
  },
  mounted() {
    let sidenavs = document.querySelectorAll("#mobile-demo-1");
    M.Sidenav.init(sidenavs, { edge: "right" });
    var elems = document.querySelectorAll("select");
    M.FormSelect.init(elems);
  },
};
</script>

<style scoped>
#heading-filter-and-sort {
  margin: 10px;
}

.small-margin-left {
  margin-left: 5px;
}

.rounded-btn {
  border-radius: 25px;
}

.dist-to > label {
  font-size: 0.7rem;
}
</style>
