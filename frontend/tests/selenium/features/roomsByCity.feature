Feature: Rooms by city
Scenario: Select a specific city to see available rooms
Given that I am at the homepage
When I select Malmö from the välj stad dropdown menu
And I click the sök button
Then I should get a list of available hotels in Malmö