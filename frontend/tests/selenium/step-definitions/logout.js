let { $, sleep } = require('./funcs');
module.exports = function () {

   

       
        this.When(/^click the logout button$/, async function () {
            let logOut = await $('button')
            logOut.click();
        });

        this.Then(/^I should be logged out$/, async function () {
            let logInPage = await $('#div.container:nth-child(2) > div:nth-child(1) > div:nth-child(1) > h5:nth-child(1)')
            assert(logInPage, 'expected to find log in page')
            //div.container:nth-child(2) > div:nth-child(1) > div:nth-child(1) > h5:nth-child(1)
        });
    }