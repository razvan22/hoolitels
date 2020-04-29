let { $, sleep } = require('./funcs');
module.exports = function () {

    this.Given(/^I am at the result page$/, async function () {
       // vet inte om man behöver det
      });
    
      
    this.When(/^I click on filtrera_och_sortera button$/, async function () {        
        let filtreraOchSorteraButton = await $('#a.btn')
        await filtreraOchSorteraButton.click()
        assert(filtreraOchSorteraButton, "can not find filtrera och sortera button");
        await sleep(1000);
      });

    this.When(/^a panel Hitta rätt hotel för dig appears on the right$/, async function () {
        let filterPanel = await $('#heading-filter-and-sort')
        await sleep(1000)
        assert(filterPanel, "Expected filter panel to be here")

      });

    this.When(/^I choose "([^"]*)" filter options$/, async function () {       
               let barnKlubb = await $('#mobile-demo-1 > ul:nth-child(1) > label:nth-child(3) > p:nth-child(1) > span:nth-child(2)') 
               barnKlubb.click();  
               await sleep(1000);
               assert(barnKlubb, "Expected to choose barn klubb as filter option") 
      });
        

    this.When(/^I choose "([^"]*)" avstånd till strand$/, async function () {  
                let avståndTillStrand = await $('#div.s6:nth-child(1) > select:nth-child(2)');
                await avståndTillStrand.click();
                let femHundraAvståndStrand = await $('#div.s6:nth-child(1) > select:nth-child(2) > option:nth-child(2)');
                await femHundraAvståndStrand.click();
                assert(femHundraAvståndStrand,"Expected to choose 500 m. avstånd till strand");
                await sleep(1000);
      });
         

    this.When(/^I choose "([^"]*)" avsånd till centrum$/, async function () {  
        let avståndTillCentrum = await $('div.s6:nth-child(2) > select:nth-child(2)');
        await avståndTillCentrum.click();
        let tusenAvståndTillCentrum = await $('div.s6:nth-child(2) > select:nth-child(2) > option:nth-child(3)');
        await tusenAvståndTillCentrum.click();
        assert(tusenAvståndTillCentrum,"Expected to choose 1000 m. avstånd till centrum");
        await sleep(1000);
      });
         

    this.When(/^I choose "([^"]*)" sortera options$/, async function () {      
          let prisLagstTillhogst = await $('#mobile-demo-1 > ul:nth-child(1) > form:nth-child(10) > p:nth-child(1) > label:nth-child(1) > span:nth-child(2)')              
            await prisLagstTillhogst.click();
            assert(prisLagstTillhogst, "Expected to choose pris lägst till högst");
            await sleep(1000);
      });
        

    this.When(/^I click on tillämpa button$/, async function () {
           let tillampaButton = await $('#.sidenav-close');
           await tillampaButton.click();
           assert(tillampaButton, "Expected to click on tillämpa button");
           await sleep(1000);     
          // #mobile-demo-1 > ul:nth-child(1) > form:nth-child(10) > li:nth-child(6)       
        });

    this.Then(/^I should get a list of hotels based on filter$/, async function () { 
                    
    });




}