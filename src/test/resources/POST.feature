Feature: Send POST Request and Verify Response

  Background:
    * url 'https://reqres.in/api/users'
    * header Content-Type = 'application/json'
  @regression
  Scenario:
    Given path '/api/users'
    Given postBody=read("postbody.json")
    And request postBody
    When method POST
    Then status 201

    And def userRes = response
    Then match userRes.id == '#notnull'
    Then match userRes == '#object'
    Then match userRes.name == '#string'



