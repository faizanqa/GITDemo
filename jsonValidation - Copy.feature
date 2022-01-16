Feature: To Test the get end point of the application

Background: Setup the Base path
		Given url 'http://localhost:9897'

Scenario: To get the data in JSON format and validate specific property
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
		And match response.[0].experience.[1] == 'Apple'
		And match response.[0].project.[0].projectName == 'Movie App'
		And match response.[0].project.[0].technology.[2] == 'Gradle'
		#validate size of Array
		And match response.[0].experience == '#[3]'
		And match response.[0].project.[0].technology == '#[3]'
		#Using wild card
		And match response.[0].project.[0].technology.[*] == ['Kotlin','SQL Lite','Gradle']
		#Using Contains with  wild card
		And match response.[0].experience[*] contains ['Apple']
		And match response.[0].project.[0].technology.[*] contains ['SQL Lite','Kotlin']
		And match response.[*].jobId contains 1
		