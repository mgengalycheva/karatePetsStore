Feature: pet testing

  Background:
    * url baseUrl
    * def petBase = '/pet/'

  Scenario: Get data
    Given path petBase + '2'
    When method GET
    Then status 200
    And print response
  #  And match response.name contains 'Astro'
    And match response.id != null