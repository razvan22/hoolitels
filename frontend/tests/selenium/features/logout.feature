Feature: Logout



Background: Logged in user on Hoolitels webpage
Given that I am at the homepage
And I am currently logged in

    Scenario: Logging out
        When click the logout button
        Then I should be logged out
