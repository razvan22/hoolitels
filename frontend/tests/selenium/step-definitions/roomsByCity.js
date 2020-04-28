let { $, sleep } = require('./funcs');
module.exports = function () {

    this.When(/^I select Malmö from the välj stad dropdown menu$/, async function () {
        let dropDown = await $('body > main > div > div.row > div:nth-child(1)');
        dropDown.click();
        await sleep(200);
        //let malmo = $('#select-options-db935abb-f02c-41e7-6c9a-303f8d1d60dd7');
        //let malmo = await driver.findElements(by.text('Malmö'));
        var xpath = "//li[contains(text(),'Malmö')]";
        xpath.click();
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