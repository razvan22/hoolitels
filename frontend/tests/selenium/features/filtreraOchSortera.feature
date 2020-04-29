Feature: Use filtrering and sortering options to get the right hotel

Background: I am at the homepage and choose a city
   Given that I am at the homepage
   And I select Malmö from the välj stad dropdown menu

   Scenario Outline: Filtrera and sortera
   #And I select <number_of_rooms> from dropdown menu
   #And I select <arrival_date> in calendar
   #And I select <departure_date> in calendar
   And I click the sök button
   And I am at the result page
   When I click on filtrera_och_sortera button
   And a panel Hitta rätt hotel för dig appears on the right 
   And I choose "<filter_options>" filter options
   And I choose "<avstånd_till_strand>" avstånd till strand
   And I choose "<avstånd_till_centrum>" avstånd till centrum
   And I choose "<sortera_option>" sortera options
   And I click on tillämpa button
   Then I should get a list of hotels based on filter

   Examples:

   |filter_options     |avstånd_till_strand|avstånd_till_centrum|sortera_option         |
   |Barnklubb          |500                |1000                |Pris lägst till högst  |
   |Kvällsunderhållning|1500               |2000                |Pris högst till lägst  |
   |Pool               |2000               |1500                |Omdöme lägst till högst|
   |Restaurang         |2500               |2500                |Omdöme högst till lägst|



  