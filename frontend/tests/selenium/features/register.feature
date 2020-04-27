Feature: register a account
 
 
 Scenario: register
  Given that I am at the homepage
  And I click on the user icon
  And I click on Don't have an account? link text
  And I click anywhere on the site
  When I enter my för och efternamn
  #And I enter my email
  And I enter my land
  #And I enter my stad
  And I enter my adress
  And I enter my postnummer
  #And I enter my lösenord
  And I enter bekräfta lösenord
  And I enter my telefonnummer
  And I press the submit button
  Then I should have a account 


