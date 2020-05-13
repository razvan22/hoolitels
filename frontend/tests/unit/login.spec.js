import { enableFetchMocks } from 'jest-fetch-mock'
enableFetchMocks()

import store from '@/store/index.js'

<<<<<<< HEAD
describe('Login and logout', () => {
    let login = {email: "user", password: "user"}
    let response = {"id":2063,"name":"user","email":"user","address":"uservejen 1","zip":"11111","city":"usercity","phone":"012345678","bookings":[{"id":30,"roombookings":[{"id":27,"extra_bed":0,"food_cost":0,"room_cost":900,"room_id":4366,"booking_id":30},{"id":25,"extra_bed":0,"food_cost":0,"room_cost":900,"room_id":4453,"booking_id":30},{"id":26,"extra_bed":0,"food_cost":0,"room_cost":900,"room_id":4678,"booking_id":30}],"num_adults":2,"num_children":0,"num_infants":0,"start_date":"2020-06-24","end_date":"2020-06-27","comment":"This better be worth the money","paid":true,"userName":"user"}],"reviews":[],"country_id":227}
    
=======
/*
describe('Login', () => {
    let login = { "username": "user", "password": "user" };
    let expectedResponse = { "id": 2063, "name": "user", "email": "user", "address": "uservejen 1", "zip": "11111", "city": "usercity", "phone": "012345678", "bookings": [], "reviews": [], "country_id": 227 };

>>>>>>> e84e947826665240d849b6044bbd9ab643108fcf
    test('user login', async () => {
        let capturedResponse = JSON.stringify(response);
        console.log(capturedResponse);
        fetch.resetMocks();
        fetch.once(capturedResponse);
        //await store.dispatch('springLogin', login);
        await store.dispatch('isUserLogged');
        expect(store.state.user).toEqual(response);
        //expect(store.state.userLogged).to.be.true;
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