Feature: Send and Verify PUT Request

  Background:
    * url 'http://localhost:3000/v2'
    * header Content-Type = 'application/json'

  Scenario: PUT request
    def customPayload = ["firstname": "morpheus","lastname": "johnny","status": "active"]

    Given path '/users/1'
    And request { "name": "morpheus", "job": "zion resident"}
    When method PUT
    Then status 200

    And def apiResponse = response
    Then match apiResponse.job contains 'zion resident'