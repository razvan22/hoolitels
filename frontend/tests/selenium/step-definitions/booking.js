let { $, sleep } = require('./funcs');
module.exports = function () {
     
   

  this.When(/^I click on the boka rum på detta hotell button$/, async function () {  
    await sleep(2000);  
    let bokaButton = await $('body > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > div:nth-child(3) > a:nth-child(1)');
    //Actions actions = new Actions(driver);
    actions.moveToElement(element).click().build().perform();
    bokaButton.click();
    assert(bokaButton, "can not find boka button");
    await sleep(2000);  
   
  });

  this.When(/^I should get the list of available rooms$/, async function () {      
    let room = await $('.card-content > div:nth-child(3) > div:nth-child(1)');
    assert(room, "expected to find a list of available rooms");
    await sleep(2000);
  });
     
  
  this.When(/^I choose number of rooms from dropdown menu$/, async function () {  
    let  numberOfRooms = await $('.card-content > div:nth-child(3) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > input:nth-child(1)');
    numberOfRooms.click();
    await sleep(2000);
    let numberOne = await $('#select-options-b868878f-7bf1-3dee-7ae6-f4df4c33e8001');
    numberOne.click();
    assert(numberOne, "expected to choose the number of rooms");
    await sleep(2000);
    
  });

  this.When(/^I click on the boka rum button$/, async function () {
    let bokaRum = await $('');
    bokaRum.click();
    assert(bokaRum, "Expected to click on the boka rum button");
    await sleep(2000);
  });

  this.When(/^I should see the order page$/, async function () {
    let orderPage = await $('');
    assert(orderPage, "expected to find an order page");
    await sleep(2000);
  });
  
  this.When(/^I choose number of adults$/, async function () {
    let numberOfAdults = await $('');
    numberOfAdults.click();
    assert(numberOfAdults, "expected to choose the number of adults");
    await sleep(2000);
  });

  this.When(/^I click on the fortsätt till betalning button$/, async function () { 
    let payButton = await $('');
    payButton.click();
    assert(payButton, "Expected to click on the betalning button");
    await sleep(2000);
  });

  
  this.When(/^I should see the payment page$/, async function () {
    let paymentPage = await $('');
    assert(paymentPage, "expected to find a payment page");
    await sleep(2000);
  });


    }

    


    







      
    











