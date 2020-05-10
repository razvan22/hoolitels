import { enableFetchMocks } from 'jest-fetch-mock'
enableFetchMocks()

import store from '@/store/index.js'

/*
describe('Login', () => {
    let login = { "username": "user", "password": "user" };
    let expectedResponse = { "id": 2063, "name": "user", "email": "user", "address": "uservejen 1", "zip": "11111", "city": "usercity", "phone": "012345678", "bookings": [], "reviews": [], "country_id": 227 };

    test('user login', async () => {
        fetch.mockResponseOnce(JSON.stringify(expectedResponse));
        await store.dispatch('springLogin', login);
        expect(store.state.user).to.eql(expectedResponse);
    })


})
*/

describe('Login', ()=>{

    let credentials = {"username":"user","password":"user"}
    let expectedUserData = {"id": 2063, "name": "user", "email": "user", "address": "uservejen 1", "zip": "11111", "city": "usercity", "phone": "012345678", "bookings": [], "reviews": [], "country_id": 227}
  
    test('user login', async ()=>{
      fetch.mockResponseOnce(JSON.stringify(expectedUserData))
      await store.dispatch('login', credentials)
      expectedUserData.adress = {}
      expect(store.state.user).toEqual(expectedUserData)
    })
  
  })