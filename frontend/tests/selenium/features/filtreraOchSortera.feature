Feature: Use filtrering and sortering options to get the right hotel

Background: I am at the homepage and choose a city
   Given that I am at the homepage
   When I select Malmö from the välj stad dropdown menu

   Scenario Outline: As a user I would like to use filtrera and sortera functions to choose a right hotel
   #And I select <number_of_rooms> from dropdown menu
   #And I select <arrival_date> in calendar
   #And I select <departure_date> in calendar
   And I click the sök button
   And I should get a list of available hotels in Malmö
   When I click on filtrera_och_sortera button
   And a panel Hitta rätt hotel för dig appears on the right 
   And I choose <filter_options> filter options
   And I choose <strand> avstånd till strand
   And I choose <centrum> avstånd till centrum
   And I choose <sortera_option> sortera options
   And I click on tillämpa button
   Then I should get a list of hotels based on filter

   Examples:

   |filter_options     |strand               |centrum               |sortera_option         |
   |Barnklubb          |fem hundra           |tusen                 |Pris lägst till högst  |
   |Kvällsunderhållning|tusen fem hundra     |två tusen             |Pris högst till lägst  |
   |Pool               |två tusen            |tusen fem hundra      |Omdöme lägst till högst|
   |Restaurang         |två tusen fem hundra |två tusen fem hundra  |Omdöme högst till lägst|



  