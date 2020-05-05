let { $, sleep } = require('./funcs');
module.exports = function () {

    this.When(/^I select Malmö from the välj stad dropdown menu$/, async function () {
        await sleep(2000);
        let dropDown = await $('.m11 > div:nth-child(1) > input:nth-child(1)');
        dropDown.click();
        await sleep(2000);
        let malmo = await driver.findElement(By.xpath('/html/body/div[1]/div/div/main/body/div/div/div[2]/div[1]/div/div/ul/li[8]/span'));
        
        malmo.click();
        await sleep(2000)
      
    });

    this.When(/^I click the sök button$/, async function () {
        let button = await $('.search-btn');
        
        button.click();
        await sleep(1000);
      });

    this.Then(/^I should get a list of available hotels in Malmö$/, async function () {
       let hotel= await $('body > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > div:nth-child(2)')
       assert(hotel, 'Expected there to be an information about hotel');
    await sleep(2000);
    });
}