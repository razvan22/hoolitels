let { $, sleep } = require('./funcs');
module.exports = function () {

    
    
      
    this.When(/^I click on filtrera_och_sortera button$/, async function () {        
        let filtreraOchSorteraButton = await $('a.btn')
        await filtreraOchSorteraButton.click()
        assert(filtreraOchSorteraButton, "can not find filtrera och sortera button");
        await sleep(1000);
        
      });

    this.When(/^a panel Hitta rätt hotel för dig appears on the right$/, async function () {
        let filterPanel = await $('#heading-filter-and-sort')
        await sleep(1000)
        assert(filterPanel, "Expected filter panel to be here")

      });

      this.When(/^I choose Barnklubb filter options$/, async function () {    
        let barnKlubb = await $('#mobile-demo-1 > ul:nth-child(1) > label:nth-child(3) > p:nth-child(1) > span:nth-child(2)') 
        barnKlubb.click();  
        await sleep(1000);
        assert(barnKlubb, "Expected to choose barn klubb as filter option") 
                
      });

      this.When(/^I choose Kvällsunderhållning filter options$/, async function () {          
        let eveningEvents = await $('#mobile-demo-1 > ul:nth-child(1) > label:nth-child(4) > p:nth-child(1) > span:nth-child(2)') 
        eveningEvents.click();  
        await sleep(1000);
        assert(eveningEvents, "Expected to choose kvällsunderhållning as filter option") 
         
});

this.When(/^I choose Pool filter options$/, async function () {     
  let swimmingPool = await $('#mobile-demo-1 > ul:nth-child(1) > label:nth-child(5) > p:nth-child(1) > span:nth-child(2)') 
  swimmingPool.click();  
  await sleep(1000);
  assert(swimmingPool, "Expected to choose pool as filter option") 
   
});

this.When(/^I choose Restaurang filter options$/, async function () {     
  let restaurant = await $('#mobile-demo-1 > ul:nth-child(1) > label:nth-child(6) > p:nth-child(1) > span:nth-child(2)') 
  restaurant.click();  
  await sleep(1000);
  assert(restaurant, "Expected to choose restaurang as filter option") 
   
});
        


this.When(/^I choose fem hundra avstånd till strand$/, async function () {
      let avståndTillStrand = await $('div.dist-to:nth-child(1) > select:nth-child(2)');
      await avståndTillStrand.click();
      let femHundraAvståndStrand = await $('div.dist-to:nth-child(1) > select:nth-child(2) > option:nth-child(2)');
      await femHundraAvståndStrand.click();
      assert(femHundraAvståndStrand,"Expected to choose 500 m. avstånd till strand");
      await sleep(1000);
      });

      this.When(/^I choose tusen fem hundra avstånd till strand$/, async function () {     
        let avståndTillStrand = await $('div.dist-to:nth-child(1) > select:nth-child(2)');
        await avståndTillStrand.click();
        let tusenFemHundraAvståndStrand = await $('div.dist-to:nth-child(1) > select:nth-child(2) > option:nth-child(4)');
        await tusenFemHundraAvståndStrand.click();
        assert(tusenFemHundraAvståndStrand,"Expected to choose 1500 m. avstånd till strand");
        await sleep(1000);
      });

      this.When(/^I choose två tusen avstånd till strand$/, async function () {
        let avståndTillStrand = await $('div.dist-to:nth-child(1) > select:nth-child(2)');
        await avståndTillStrand.click();
        let tvåTusenAvståndStrand = await $('div.dist-to:nth-child(1) > select:nth-child(2) > option:nth-child(5)');
        await tvåTusenAvståndStrand.click();
        assert(tvåTusenAvståndStrand,"Expected to choose 2000 m. avstånd till strand");
        await sleep(1000);
      });

      this.When(/^I choose två tusen fem hundra avstånd till strand$/, async function () { 
        let avståndTillStrand = await $('div.dist-to:nth-child(1) > select:nth-child(2)');
        await avståndTillStrand.click();
        let tvåTusenFemHundraAvståndStrand = await $('div.dist-to:nth-child(1) > select:nth-child(2) > option:nth-child(6)');
        await tvåTusenFemHundraAvståndStrand.click();
        assert(tvåTusenFemHundraAvståndStrand,"Expected to choose 2500 m. avstånd till strand");
        await sleep(1000);
      });
         

      this.When(/^I choose tusen avstånd till centrum$/, async function () {  
        let avståndTillCentrum = await $('div.s6:nth-child(2) > select:nth-child(2)');
        await avståndTillCentrum.click();
        let tusenAvståndTillCentrum = await $('div.s6:nth-child(2) > select:nth-child(2) > option:nth-child(3)');
        await tusenAvståndTillCentrum.click();
        assert(tusenAvståndTillCentrum,"Expected to choose 1000 m. avstånd till centrum");
        await sleep(1000);
      });

      this.When(/^I choose två tusen avstånd till centrum$/, async function () {
        let avståndTillCentrum = await $('div.s6:nth-child(2) > select:nth-child(2)');
        await avståndTillCentrum.click();
        let tvåTusenAvståndTillCentrum = await $('div.dist-to:nth-child(2) > select:nth-child(2) > option:nth-child(5)');
        await tvåTusenAvståndTillCentrum.click();
        assert(tvåTusenAvståndTillCentrum,"Expected to choose 2000 m. avstånd till centrum");
        await sleep(1000);
      });

      this.When(/^I choose tusen fem hundra avstånd till centrum$/, async function () {    
        let avståndTillCentrum = await $('div.s6:nth-child(2) > select:nth-child(2)');
        await avståndTillCentrum.click();
        let tusenFemHundraAvståndTillCentrum = await $('div.dist-to:nth-child(2) > select:nth-child(2) > option:nth-child(4)');
        await tusenFemHundraAvståndTillCentrum.click();
        assert(tusenFemHundraAvståndTillCentrum,"Expected to choose 1500 m. avstånd till centrum");
        await sleep(1000);
      });

      this.When(/^I choose två tusen fem hundra avstånd till centrum$/, async function () {    
        let avståndTillCentrum = await $('div.s6:nth-child(2) > select:nth-child(2)');
        await avståndTillCentrum.click();
        let tvåTusenFemHundraAvståndTillCentrum = await $('div.dist-to:nth-child(2) > select:nth-child(2) > option:nth-child(6)');
        await tvåTusenFemHundraAvståndTillCentrum.click();
        assert(tvåTusenFemHundraAvståndTillCentrum,"Expected to choose 2500 m. avstånd till centrum");
        await sleep(1000);

      });
         

      this.When(/^I choose Pris lägst till högst sortera options$/,  async function () {      
          let prisLagstTillhogst = await $('#mobile-demo-1 > ul:nth-child(1) > form:nth-child(10) > p:nth-child(1) > label:nth-child(1) > span:nth-child(2)')              
            await prisLagstTillhogst.click();
            assert(prisLagstTillhogst, "Expected to choose pris lägst till högst");
            await sleep(1000);
      });
        

    this.When(/^I click on tillämpa button$/, async function () {
           let tillampaButton = await $('#mobile-demo-1 > ul:nth-child(1) > form:nth-child(10) > li:nth-child(6)');
           await tillampaButton.click();
           assert(tillampaButton, "Expected to click on tillämpa button");
           await sleep(1000);     
          // #mobile-demo-1 > ul:nth-child(1) > form:nth-child(10) > li:nth-child(6)       
        });

        
       this.When(/^I choose Pris högst till lägst sortera options$/, async function () {    
        let prisHögstTillLägst = await $('p.small-margin-left:nth-child(2) > label:nth-child(1) > span:nth-child(2)')              
        await prisHögstTillLägst.click();
        assert(prisHögstTillLägst, "Expected to choose pris högst till lägst")              
        await sleep(1000);
            //#price-hi-low
      });

      this.When(/^I choose Omdöme lägst till högst sortera options$/, async function () {  
        let omdömelägstTillHögst = await $('p.small-margin-left:nth-child(3) > label:nth-child(1) > span:nth-child(2)')              
        await omdömelägstTillHögst.click();
        assert(omdömelägstTillHögst, "Expected to choose omdöme lägst till högst")              
        await sleep(1000);
      });

      this.When(/^I choose Omdöme högst till lägst sortera options$/, async function () {  
        let omdömeHögstTillLägst = await $('p.small-margin-left:nth-child(4) > label:nth-child(1) > span:nth-child(2)')              
        await omdömeHögstTillLägst.click();
        assert(omdömeHögstTillLägst, "Expected to choose omdöme högst till lägst")              
        await sleep(1000);
      });

    this.Then(/^I should get a list of hotels based on filter$/, async function () { 
                    
    });




}