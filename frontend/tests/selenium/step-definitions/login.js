let { $, sleep } = require('./funcs');
module.exports = function () {

    this.Given(/^that I am at the Hoolitels homepage$/, async function () {
        let homepage = await helpers.loadPage('http://localhost:8080/');
        //await sleep(10000);
        let logo = await driver.findElement(by.css('#app'));
        assert(logo, 'Expected there to be a div element named "app"');
        assert(homepage, 'Expected the homepage to load');
      });

      this.When(/^I click on the user icon$/, async function () {
        let loginButton = await $('#header > div > div > div.col.s3.m2.l2 > i');
        loginButton.click();
        assert(loginButton, 'Expected to find the user icon');

      });

      this.When(/^I enter "([^"]*)" in the email field$/, async function (email) {
        let emailBox = await $('#email');
        emailBox.sendKeys(email);
        await sleep(500);
      });

      this.When(/^I enter "([^"]*)" in the password field$/, async function (password) {
        let passwordBox = await $('#password');
        passwordBox.sendKeys(password);
        await sleep(500);
      });
  
      this.When(/^I click the login button$/, async function () {
        //let loginButton = await driver.getElementByTagName('button');
        let loginButton = await $('#slide-out > div > div.container > div:nth-child(2) > div:nth-child(3) > button');
        loginButton.click();
        console.log(loginButton);
        await sleep(2000);        
      });

      //finish this code when login is working!!
      this.Then(/^I should be logged in$/, async function () {
        let something = await $('nameofsomething');
        assert(something, 'Expected to be logged in');
      
      });
}