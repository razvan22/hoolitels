let { $, sleep } = require('./funcs');
module.exports = function () {

    this.Given(/^that I am on the homepage$/, async function () {
        let homepage = await helpers.loadPage('http://localhost:8080/');
        let logo = await $('#app');
        assert(logo, 'Expected there to be a div element named "app"');
        assert(homepage, 'Expected the homepage to load');
    });

    this.When(/^I select Malmö from the välj stad dropdown menu$/, async function () {
        let dropDown = await driver.findElements(by.innerHTML('Välj stad'));
        dropDown.click();
        await sleep(200);
        var malmo = await driver.findElement(by.innerHTML('Malmö'));
        console.log(malmo);
        malmo.click();
        await sleep(200)
        //write assert test that Malmö is in the välj stad dropdown
    });

    this.When(/^I click the sök button$/, async function () {
        let button = await $('body > main > div > div.center-align > a');
        button.click();
        await sleep(1000);
      });

    this.Then(/^I should get a list of available rooms in Malmö$/, async function () {
        // Write code here that turns the phrase above into concrete actions
        callback(null, 'pending');
    });
}