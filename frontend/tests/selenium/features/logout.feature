Feature: Logout

    Scenario: Logging out
        Given that I am on the hoolitels site
        And I am currently logged in
        And click the logout button
        Then I should be logged out
