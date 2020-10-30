Feature:

  Background:
    * url 'http://127.0.0.1:5000'
    * header Content-Type = 'application/json'

  Scenario Outline: Get String length
    Given path "/count"
    And request {"name":"<name>"}
    When method POST
    Then status 200
    And match $ == {length:<length>}

    Examples:
      | name  | length |
      | Tim   | 3      |
      | Liz   | 3      |
      | Selma | 5      |
      | Ted   | 3      |
      | Luise | 5      |
