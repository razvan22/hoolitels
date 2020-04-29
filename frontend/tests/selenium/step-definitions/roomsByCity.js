let { $, sleep } = require('./funcs');
module.exports = function () {

    this.Given(/^that I am on the homepage$/, async function () {
        let homepage = await helpers.loadPage('http://localhost:8080/');
        let logo = await $('#app');
        assert(logo, 'Expected there to be a div element named "app"');
        assert(homepage, 'Expected the homepage to load');
        await sleep(200)
    });

    this.When(/^I select Malmö from the välj stad dropdown menu$/, async function () {
        let dropDown = await $();
        dropDown.click();
        await sleep(200);
        let malmo = $('#select-options-3dc0315d-4269-7516-cf1d-50312ef6ac767 > span:nth-child(1)');
        //let malmo = await driver.findElements(by.text('Malmö'));
        //var xpath = "//li[contains(text(),'Malmö')]";
        malmo.click();
        await sleep(200)
        //write assert test that Malmö is in the välj stad dropdown
        //'body > main > div > div.row > div:nth-child(1)'
       
        //#select-options-db935abb-f02c-41e7-6c9a-303f8d1d60dd7
       //dropDown  #select-options-3dc0315d-4269-7516-cf1d-50312ef6ac760 > span:nth-child(1)
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