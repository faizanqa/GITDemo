Feature: To Test the get end point of the application

	Background: Setup the Base path
		Given url 'http://localhost:9897'
		And print '--------------This is background Keyword-------------'

  Scenario: To get all the data from application in JSON format
		Given path '/normal/webapi/all'
    When method get
    Then status 200
    
    Scenario: To get all the data from application in JSON format using path variable
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    
   Scenario: To get all the data from application in JSON format using path variable
    And path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
		#And print response