Feature: check returned countries by URL

  Background:
    * url 'https://restcountries.eu/'
    * header Accept = 'application/json'

  Scenario: Get all countries list
    Given path 'rest/v2/all'
    When method get
    Then status 200