module.exports = function () {

this.Given(/^that I am at the homepage$/, async function () {
    let homepage = await helpers.loadPage('http://localhost:8080/');
    //await sleep(10000);
    let logo = await driver.findElement(by.css('#app'));
    assert(logo, 'Expected there to be a div element named "app"');
    assert(homepage, 'Expected the homepage to load');
  });

  this.Then(/^I should see the Hoolitels logo$/, async function () {
    let logo = await driver.findElement(by.css('#app'));
    assert(logo, 'Expected there to be a div element named "app"');
  });

}