//just using this at the moment to load code -- work on this later to better understanding
import { enableFetchMocks } from 'jest-fetch-mock'
enableFetchMocks()
import store from '@/store/index.js'

//imports assert,expect and should from chai's assertion library so we can use https://www.chaijs.com/api/bdd/
import {assert} from 'chai'
import {expect} from 'chai'
import {should} from 'chai'

//call a mutation with .commit('name', paramater)
//call an action with .dispatch('name', paramater)

describe('Change value of userLogged', () => {
    test('should start with: value = false', async () => {

        console.log("userLogged starts as: "+store.state.userLogged);
        assert.isFalse(store.state.userLogged, "should be false");
    });

    test('After commit: value = true', () => {
        console.log("userLogged before commit: " + store.state.userLogged);
        //this calls on the mutation userLogStatus with the parameter true
        store.commit('userLogStatus', true)
        console.log("userLogged after commit: " + store.state.userLogged);

        assert.isTrue(store.state.userLogged, "Should expect to be true");
        expect(store.state.userLogged).to.be.a("boolean");
        
    });    
});
