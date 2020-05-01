Feature: register a account
 
 
 Scenario: register
  Given that I am at the homepage
  And I click on the user icon
  And I click on skapa konto link text
  And I click anywhere on the site
  When I enter my name
  And I enter my email
  And I enter my postnummer
  And I enter my adress
  And I choose my country from the list of countrys
  And I enter my stad
  And I enter my telefonnummer
  And I enter my lösenord
  And I enter bekräfta lösenord
  And I press the registrera button
  Then I should have a account 


