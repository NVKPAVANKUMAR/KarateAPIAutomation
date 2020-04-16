Feature: Send and Verify PUT Request

  Background:
    * url 'https://reqres.in'
    * header Content-Type = 'application/json'

  Scenario: PUT request
    Given path '/api/users/2'
    And request { "name": "morpheus", "job": "zion resident"}
    When method PUT
    Then status 200
    
    And def apiResponse = response 
    Then match apiResponse.job contains 'zion resident'