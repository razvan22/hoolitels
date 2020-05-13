import { enableFetchMocks } from 'jest-fetch-mock'
enableFetchMocks()

import store from '@/store/index.js'

describe('Login and logout', () => {
    let login = {email: "user", password: "user"}
    let response = {"id":2063,"name":"user","email":"user","address":"uservejen 1","zip":"11111","city":"usercity","phone":"012345678","bookings":[{"id":30,"roombookings":[{"id":27,"extra_bed":0,"food_cost":0,"room_cost":900,"room_id":4366,"booking_id":30},{"id":25,"extra_bed":0,"food_cost":0,"room_cost":900,"room_id":4453,"booking_id":30},{"id":26,"extra_bed":0,"food_cost":0,"room_cost":900,"room_id":4678,"booking_id":30}],"num_adults":2,"num_children":0,"num_infants":0,"start_date":"2020-06-24","end_date":"2020-06-27","comment":"This better be worth the money","paid":true,"userName":"user"}],"reviews":[],"country_id":227}
    
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
