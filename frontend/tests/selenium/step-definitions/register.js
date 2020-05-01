let { $, sleep } = require('./funcs');
module.exports = function () {

 sleepTime = 1000;


 this.Given(/^I click on skapa konto link text$/, async function () {
  let newAccount = await $('#login > div > div.container > div:nth-child(2) > div:nth-child(4) > a');
  newAccount.click()
  assert(newAccount, 'Expected to find the "skapa konto" text');
 });

 this.Given(/^I click anywhere on the site$/, async function () {
  let randomClick = await $('body > div.sidenav-overlay');
  randomClick.click()
  assert(randomClick, 'Expected to leave the overlay');
 });

 this.When(/^I enter my name$/, async function () {
  let myFullName = 'Marian Towfik'
  let nameInput = await $('#full_name')
  nameInput.click()
  await nameInput.sendKeys(myFullName)
  assert.instanceOf(nameInput, nameInput.constructor, "could not enter full name");
  await sleep(sleepTime)
 });
 

 this.When(/^I enter my email$/, async function () {
  let emailAdress = 'Marian99@live.se'
  let emailfield = await $('#container-bg > div:nth-child(1) > div:nth-child(2)')
  await emailfield.sendKeys(emailAdress)
  assert.instanceOf(emailfield, emailfield.constructor, "could not enter email adress");
  await sleep(sleepTime)
 });

this.When(/^I enter my postnummer$/, async function () {
  let postalcode = '12345';
  let postalcoderInput = await $('#zip');
  await postalcoderInput.sendKeys(postalcode)
  assert.instanceOf(postalcoderInput, postalcoderInput.constructor, "could not enter a postalcode");
  await sleep(sleepTime)
 });

 this.When(/^I enter my adress$/, async function () {
  let address = 'exempelvägen 2';
  let addressInput = await $('#address');
  await addressInput.sendKeys(address)
  assert.instanceOf(addressInput, addressInput.constructor, "could not enter a land");
  await sleep(sleepTime)
 });

 
 
 this.When(/^I choose my country from the list of countrys$/, async function () {
  let myCountry = await $('#container-bg > div:nth-child(3) > div.col.s12.m8.l8 > div > div > input');
  myCountry.click()
/*
  let sweden = await $('#select-options-244facc5-48d1-bdd5-b055-5a6c63b82ded212')
  sweden.click()
  */
  assert(myCountry, "could not choose a country");
  await sleep(sleepTime)

 });

 this.When(/^I enter my stad$/, async function () {
  let city = 'Lund';
  let cityInput = await $('#city');
  await cityInput.sendKeys(city)
  assert.instanceOf(cityInput, cityInput.constructor, "could not enter a city");
  await sleep(sleepTime)
 });

 
this.When(/^I enter my telefonnummer$/, async function () {
  let phonenumber = '0704563735'
  let numberInput = await $(' #telephone')
  await numberInput.sendKeys(phonenumber)
  assert.instanceOf(numberInput, numberInput.constructor, "could not enter a valid phonenumber");
  await sleep(sleepTime)

 });

 

 this.When(/^I enter my lösenord$/, async function () {
  let password = 'hoolitels'
  let passwordInput = await $('#password')
  await passwordInput.sendKeys(password)
  assert.instanceOf(passwordInput, passwordInput.constructor, "could not enter a password");
  await sleep(sleepTime)
 });

 
 this.When(/^I enter bekräfta lösenord$/, async function () {
  let confirmPassword = 'hoolitelshoolitels'
  let comfirmPasswordInput = await $('#confirm_password')
  await comfirmPasswordInput.sendKeys(confirmPassword)
  assert.instanceOf(comfirmPasswordInput, comfirmPasswordInput.constructor, "could not confirm the password");
  await sleep(sleepTime)
 });


 this.When(/^I press the registrera button$/, async function () {
  let submitButton = await $('#submit-btn > div > button')
  await submitButton.click()
  assert(submitButton, "can not find submit button");
  await sleep(sleepTime)
 });

 this.Then(/^I should have a account$/, function (callback) {
  // Write code here that turns the phrase above into concrete actions
  callback(null, 'pending');
 });


}