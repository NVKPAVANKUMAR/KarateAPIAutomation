Feature: check returned by the API

  Background:
    * url 'https://gorest.co.in'
    * header Authorization = 'Bearer aiaNbEQAp9Q3SHTR_UnEvVlZWKypxiI4hpi0'

  Scenario: list all users having name with john
    Given path 'public-api/users'
    And param first_name = 'john'
    When method get
    Then status 200

    And def userResponse = response
    Then match userResponse.result[*].first_name contains ['John']

