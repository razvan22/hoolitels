let { $, sleep } = require('./funcs');
module.exports = function () {
     
   

  this.When(/^I click on the boka rum på detta hotell button$/, async function () {  
    await sleep(1000);  
     let bokaButton = await $('body > div:nth-child(2) > div.col.s12.m6 > div > div.card-action.align-center > a');
     //the line below will scroll the page so the element(in this case 'bokaButton') is at the top
     driver.executeScript("arguments[0].scrollIntoView(true);", bokaButton);
     await sleep(300)
     bokaButton.click();
    assert(bokaButton, "can not find boka button");
    await sleep(4000);  
   
    //body > div:nth-child(2) > div.col.s12.m6 > div > div.card-action.align-center > a
  });

  this.When(/^I should get the list of available rooms$/, async function () {      
    let room = await $('.card-content > div:nth-child(3) > div:nth-child(1)');
    assert(room, "expected to find a list of available rooms");
    await sleep(2000);
  });
     
  
  this.When(/^I choose number of rooms from dropdown menu$/, async function () {  
    let  numberOfRooms = await $('.card-content > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > input:nth-child(1)');
    numberOfRooms.click();
    await sleep(2000);
    let numberOne = await driver.findElement(By.xpath('/html/body/div[1]/div/div/main/div/div/div[2]/div/div[2]/div[3]/div/div[1]/div/div[1]/div[2]/div/div[2]/div/ul/li[2]/span'));
    numberOne.click();
    assert(numberOne, "expected to choose the number of rooms (1)");
    await sleep(2000);
  });

  this.When(/^I click on the boka rum button$/, async function () {
    let bokaRum = await $('.card-action > a:nth-child(1)');
    bokaRum.click();
    assert(bokaRum, "Expected to click on the boka rum button");
    await sleep(2000);
  });

  this.When(/^I should see the order page$/, async function () {
    let orderPage = await $('div.s8:nth-child(1)');
    assert(orderPage, "expected to find an order page");
    await sleep(2000);
  });
  
  this.When(/^I choose number of adults$/, async function () {
    let numberOfAdults = await $('div.guests:nth-child(4) > a:nth-child(3) > i:nth-child(1)');
    numberOfAdults.click();
    assert(numberOfAdults, "expected to choose the number of adults (1)");
    await sleep(2000);
  });

  this.When(/^I click on the fortsätt till betalning button$/, async function () { 
    let payButton = await $('.btn-continue-payment');
    payButton.click();
    assert(payButton, "Expected to click on the betalning button");
    await sleep(2000);
  });

  
  this.When(/^I should see the payment page$/, async function () {
    let paymentPage = await $('.payment-form');
    assert(paymentPage, "expected to find a payment page");
    await sleep(2000);
  });

  this.When(/^I click on the godkänn och betala din bokning button$/, async function () {
    let betalaButton = await $('.btn-payment');
    betalaButton.click();
    assert(betalaButton, "expected to click on betala button");
    await sleep(2000);
  });

  this.When(/^I click on the klicka här för att gå till din profil button$/, async function () {
      let goToProfileButton = await $('div.waves-effect');
      goToProfileButton.click();
      assert(goToProfileButton, "Expect to click on the gå till din profil button");
      await sleep(2000);
  
  });
   
  this.When(/^I should see my profile page$/, async function () {
    let profilePage = await $('#container-bg > div:nth-child(1)');
    assert(profilePage, "Expected to find my profile page");
    await sleep(2000);
  });
  
  
  this.When(/^I click on my bokningar$/, async function () {
    let myBookings = await $('.collapsible-header > i:nth-child(1)');
    driver.executeScript("arguments[0].scrollIntoView(true);", myBookings);
    myBookings.click();
    assert(myBookings, "Expect to open my bookings information");
    await sleep(2000);
  });
   
  this.Then(/^I can find my booking in the list$/, async function () {
    let recentBooking = await $('#booking > div:nth-child(1) > div:nth-child(1)');
    assert(recentBooking, "Expect to find my recent booking in the list");
  });

    }

    


    







      
    











