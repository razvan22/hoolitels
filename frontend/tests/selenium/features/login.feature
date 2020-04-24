Feature: Login of user

   Scenario Outline: Logging in
      Given that I am at the Hoolitels homepage
      When I click on the user icon
      And I enter "<email>" in the email field
      And I enter "<password>" in the password field
      And I click the login button
      Then I should be logged in

      Examples:
         | email                | password |
         | user                 | user     |
         | tdinsdaleg@naver.com | 3uROILP  |