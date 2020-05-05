Feature: Logout



Scenario Outline: Logged in user on Hoolitels webpage
Given that I am at the homepage
And I click on the user icon
And I enter "<email>" in the email field
And I enter "<password>" in the password field
And I click the login button
And I should be logged in
And I click on the user icon
When click the logout button
Then I should be logged out

 Examples:
         | email                | password |
         | user                 | user     |
