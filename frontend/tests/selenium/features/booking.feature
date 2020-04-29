Feature: Booking a room in a hotel
 
    Background: Logged in user on Hoolitels webpage
      Given that I am at the homepage
      And I am currently logged in
      When I select Malmö from the välj stad dropdown menu
      #And I select <number_of_rooms> from dropdown menu
      #And I select <arrival_date> in calendar
      #And I select <departure_date> in calendar
      And I click the sök button
      And I should get a list of available rooms
     
      
    Scenario: Booking without add-ons
        
         And I click on the boka button 
         Then my room is added to my cart 


    Scenario Outline: Booking with add-ons
 
        
         And I choose <add_on>
         And I click the boka button 
         Then my room is added to my cart
         
         Examples:

         |add_on       |
         |Extrasäng    |
         |Halvpension  |
         |Helpension   |
         |All-inclusive|

 
         
         
 
