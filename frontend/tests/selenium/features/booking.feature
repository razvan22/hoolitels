Feature: Booking a room in a hotel in Malmö
 
    Scenario Outline: Booking one room in Malmö without add-ons for 2 adults
      Given that I am at the homepage
      And I click on the user icon
      And I enter "<email>" in the email field
      And I enter "<password>" in the password field
      And I click the login button
      And I should be logged in
      When I select Malmö from the välj stad dropdown menu
      #And I select number of rooms from the rum dropdown menu
      #And I select <arrival_date> in calendar
      #And I select <departure_date> in calendar
      And I click the sök button
      And I should get a list of available hotels in Malmö
      And I click on the boka rum på detta hotell button 
      And I should get the list of available rooms
      And I choose number of rooms from dropdown menu
      And I click on the boka rum button
      And I should see the order page
      And I choose number of adults
      And I click on the fortsätt till betalning button
      And I should see the payment page
      And I click on the godkänn och betala din bokning button
      And I click on the klicka här för att gå till din profil button
      And I should see my profile page
      And I click on my bokningar
      Then I can find my booking in the list

          Examples:
         | email                | password |
         | user                 | user     |


    #Scenario Outline: Booking with add-ons
 
        
        # And I choose <add_on>
        # And I click the boka button 
        # Then my room is added to my cart
         
       #  Examples:

        # |add_on       |
        # |Extrasäng    |
        # |Halvpension  |
         #|Helpension   |
         #|All-inclusive|

 
         
         
 
