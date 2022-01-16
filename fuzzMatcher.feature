Feature: To Test the get end point of the application

Background: Setup the Base path
		Given url 'http://localhost:9897' #To launch URI
		#Operations from GIT2

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
		#FuzzyMatcher in JSON
		And match response.[0].jobId == '#notnull'
		And match response.[0].jobTitle == '#string'
		And match response.[0].project.[0].projectName == '#present'
		And match response.[0].project.[0].technology.[2] == '#ignore'
		And match response.[0].experience[0] == '#notnull'
		
		#ComplexFuzzyMatcher in JSON
		And match response.[0].jobId == '#? _>=1'
		And match response.[0].jobTitle == '#string? _.length>=6'
		
		#To Validate Array
		#To validate array is present
		And match response.[0].experience == '#[]'
		#To validate the size of an Array
		And match response.[0].experience == '#[3]'
		
		#Mae sure its a Array of String
		And match response.[0].experience == '#[3] #string'
		And match response.[0].experience == '#[3] #string? _.length>=3'
		#And match response.[0].experience == '#[3] #number'
		
Scenario: To get the data in XML format and validate specific property
    And path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And print response
		And match response/List/item/jobId == '1'
		And match response/List/item/experience/experience[2] == 'Apple'
		#Without response Keyword
		And match /List/item/project/project/projectName == 'Movie App'
		#Traverse XML similar to JSON
		And match response.List.item.experience.experience[1] == 'Apple'
		#FuzzyMatcher in XML
		