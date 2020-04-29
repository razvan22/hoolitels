<<<<<<< HEAD
Feature: Logout
=======
Feature: Logging out


Background: Logged in user on Hoolitels webpage
Given that I am at the homepage
And I am currently logged in
>>>>>>> devtest

    Scenario: Logging out
        Given that I am on the hoolitels site
        And I am currently logged in
        And click the logout button
        Then I should be logged out
