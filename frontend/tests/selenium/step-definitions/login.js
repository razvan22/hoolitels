let { $, sleep } = require('./funcs');
module.exports = function () {

    this.Given(/^that I am at the homepage$/, async function () {
        let homepage = await helpers.loadPage('http://localhost:8080/');
        //await sleep(10000);
        let logo = await driver.findElement(by.css('#app'));
        assert(logo, 'Expected there to be a div element named "app"');
        assert(homepage, 'Expected the homepage to load');
      });

      this.When(/^I click on the user icon$/, async function (email) {
        let loginButton = await driver.findElement(by.Text("account_circle"));
        

      });

      this.When(/^I enter tdinsdaleg@naver\.com in the email field$/, async function (password) {
        // Write code here that turns the phrase above into concrete actions
        callback(null, 'pending');
      });

}