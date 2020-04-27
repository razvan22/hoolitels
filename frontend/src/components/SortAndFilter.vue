<template>
<div class="container">
    <div class="row">
        <div class="sort-and-filter col s12">
                  <div class="nav-wrapper col s12 center-align">
                    <a href="#" data-target="mobile-demo-1" class="sidenav-trigger"><div><a class="waves-effect waves-light btn cyan darken-2">Filtrera och Sortera</a></div></a>
                    </div>
        </div>
    </div>
  <ul class="sidenav" id="mobile-demo-1">
        <ul>
            <h5 id="heading-filter-and-sort">Hitta rätt hotell för dig</h5>
        
            <li><h6>Filtrera</h6></li>
          
             <label v-for="a in $store.state.amenities" :key="a.id">
                 <p>
                    <input type="checkbox" class="filled-in" id="checkbox" value="a.id"  />
                     <span> {{a.name}}</span>
                   
                 </p>
                    
            </label> 
            
            <p>
       
             <li><div class="divider"></div></li>
             <li><h6>Sortera</h6></li>
               <form action="#">
                    <p>
                    <label >
                        <input class="with-gap" name="group1" type="radio" v-model="selected"/>
                        <span>Pris (högst till lägst)</span>
                    </label>
                    </p>
                      <p>
                    <label>
                        <input class="with-gap" name="group1" type="radio" v-model="selected"  />
                        <span>Pris (lägst till högst)</span>
                    </label>
                    </p>
                       <p>
                    <label>
                        <input class="with-gap" name="group1" type="radio" v-model="selected"  />
                        <span>Omdöme (högst till lägst)</span>
                    </label>
                    </p>
                          <p>
                            
                    <label>

                        <input class="with-gap" name="group1" type="radio" v-model="selected"  />
                        <span>Omdöme (lägst till högst )</span>
                         
                    </label>
                    </p>
                      <a class="waves-effect waves-light btn-small cyan darken-2" v-on:click="uncheckAll()">Rensa</a>
                </form>
           
        </ul>

        
  </ul>
  
</div>

</template>

<script>
 import M from 'materialize-css'
 
export default {
     name: "SortAndFilter",
     props: [`hotel`],
     data(){
          return{
            checked: '',
             selected: '',
            
          }
        
     },
     methods:{
         uncheckAll: function(){
           this.selected = false;
          
         },
     
  
     },
       mounted() {
        let el = document.querySelectorAll('sidenav')
        M.FormSelect.init(el)
       
    },
    
}
</script>

<style>
#heading-filter-and-sort{
  margin: 10px;  

  
}


</style>>

