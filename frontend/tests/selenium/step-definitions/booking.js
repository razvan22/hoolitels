let { $, sleep } = require('./funcs');
module.exports = function () {
     
   

    this.Given(/^I am currently logged in$/, async function () {
        
      });

    this.When(/^I should get a list of available rooms$/, async function () {        
       
        let roomsList = await $();
        assert(roomsList, "Expected signInList to be here");
        await sleep(1000);
      });

    this.When(/^I click on the boka button$/, async function () {
        let bokaButton = await $();
        await bokaButton.click()
        assert(bokaButton, "can not find boka button");
        await sleep(1000);
      });

    this.Then(/^my room is added to my cart$/, async function () {
        addedToCart = await $();
        assert(addedToCart, "Expected the room to be added to the cart");
        await sleep (1000);
    
      });

    this.When(/^I choose Extrasäng$/, async function () {
        let extraSang = await$();
        await extraSang.click();
        asert(extraSang, "Expcted Extrasäng to be chosen as add-on");
        await sleep (1000);
      });

      this.When(/^I choose Halvpension$/, async function () {
        let halvPension = await$();
        await halvPension.click();
        asert(halvPension, "Expcted Halvpension to be chosen as add-on");
        await sleep (1000);
      });

      this.When(/^I choose Helpension$/, async function () {
        let helPension = await$();
        await helPension.click();
        asert(helPension, "Expcted Helpension to be chosen as add-on");
        await sleep (1000);
      });

      this.When(/^I choose All\-inclusive$/, async function () {
        let allInclusive = await$();
        await allInclusive.click();
        asert(allInclusive, "Expcted All-inclusive to be chosen as add-on");
        await sleep (1000);
      });



    







      
    











}