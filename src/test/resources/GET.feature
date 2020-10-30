Feature: Send and Verify GET Request

  Background:
    * url 'https://reqres.in'
    * header Content-Type = 'application/json'
  @regression
  Scenario: GET request
    Given path '/api/users/2'
    When method GET
    Then status 200

    Given expectedResult=read('expected.json')
    And match response == expectedResult
    And match response.ad.url == "http://statuscode.org/"
    And match response.data.first_name == "Janet"
