Feature: check generated token by API
  Background: 
    * url 'https://reqres.in'
    * header Content-Type = 'application/json'

    Scenario: Get access token
      Given path '/api/register'
      And request { "email": "eve.holt@reqres.in","password": "pistol"}
      When method POST
      Then status 200