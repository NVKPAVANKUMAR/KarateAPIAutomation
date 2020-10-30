Feature: Send and Verify DELETE Request

  Background:
    * url 'https://reqres.in'
    * header Content-Type = 'application/json'
  @regression
  Scenario: PUT request
    Given path '/api/users/2'
    When method DELETE
    Then status 204