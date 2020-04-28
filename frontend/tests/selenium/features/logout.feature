Background: Logged in user on Hoolitels webpage
Given that I am on the hoolitels site
And I am currently logged in

Scenario: Logging out
When I click on the account icon
And click the logout button
Then I should be logged out
