Feature: Send and Verify PATCH Request

  Background:
    * url 'https://reqres.in'
    * header Accept = 'application/json'
  @regression
  Scenario:
    Given path '/api/users/2'
    And request { "name": "morpheus", "job": "zion resident"}
    When method PATCH
    Then status 200

    And def apiResponse = response
    Then match apiResponse.job contains 'zion resident'