Feature: test soap end point

  Background:
    * url 'http://www.dneonline.com/calculator.asmx'

    # way - 1 passing with request body
  Scenario: soap 1.1
    Given request
    """
    <?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
        <Add xmlns="http://tempuri.org/">
          <intA>2</intA>
          <intB>3</intB>
        </Add>
      </soap:Body>
    </soap:Envelope>
    """
    When soap action 'http://tempuri.org/Add'
    Then status 200
    And match /Envelope/Body/AddResponse/AddResult == 5
    And print 'response: ', response


    # way - 2 passing via xml file
  @regression
  Scenario: soap 1.2
    Given request read('request.xml')
    And header Content-Type = 'text/xml; charset=utf-8'
    When method post
    Then status 200
    And match /Envelope/Body/AddResponse == read('expected.xml')