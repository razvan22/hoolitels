import { enableFetchMocks } from 'jest-fetch-mock'
enableFetchMocks()

import store from '@/store/index.js'

describe('Search rooms by city', () => {
 let requestPayload = {"city_id":115,"start_date":"2020-05-01T11:00:23.738Z","end_date":"2020-05-03T11:00:23.739Z","nr_of_rooms":1}
 let expectedRequestResponse = 

    test('', () => {
        fetch.mockResponseOnce();
        await store.dispatch();
        expect(store.state).to.eql(value);
    });

    
});