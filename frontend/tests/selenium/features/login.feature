Feature: Login of user

   Scenario Outline: Logging in
      Given that I am at the homepage
      When I click on the user icon
      And I enter <email> in the email field
      And I enter <password> in the password field
      Then I should be logged in

      Examples:
         | email                | password |
         | user                 | user     |
         | tdinsdaleg@naver.com | 3uROILP  |