let { $, sleep } = require('./funcs');
module.exports = function () {

    this.Given(/^that I am on the hoolitels site$/, async function () {
        let homepage = await helpers.loadPage('http://localhost:8080/');
        let logo = await $('#app');
        assert(logo, 'Expected there to be a div element named "app"');
        assert(homepage, 'Expected the homepage to load');
    });

        this.Given(/^I am currently logged in$/, async function () {
            let toLoginButton = await $('#header > div > div.col.s12.m6 > i');
            toLoginButton.click();
            let emailBox = await $('#username');
            emailBox.sendKeys('user');
            await sleep(200);
            let passwordBox = await $('#password');
            passwordBox.sendKeys('user');
            await sleep(200);
            let loginButton = await $('button');
            loginButton.click();
            console.log(loginButton);
            await sleep(1000);

        });

        this.When(/^click the logout button$/, async function () {
            let logOut = await $('button')
            logOut.click();
        });

        this.Then(/^I should be logged out$/, async function () {
            let loggedOut = await $('#login > div > div.container > div:nth-child(1) > div > h5')
            assert(loggedOut, 'expected to be logged out')
        });
    }