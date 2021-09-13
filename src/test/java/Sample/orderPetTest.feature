Feature: create Pet, place an order for a Pet

  Background:
    * url baseUrl

  Scenario: create Pet
    * def pet =
    """
    {
      "id": 12,
      "category": {
        "id": 0,
        "name": "mouse"
      },
      "name": "Mimi",
      "photoUrls": [
        "photoUrl"
      ],
      "tags": [
        {
          "id": 0,
          "name": "tiny"
        }
      ],
      "status": "available"
    }
    """
    Given path '/pet'
    And request pet
    When method POST
    Then status 200

  Scenario: place an order
    * def order =
    """
      {
        "id": 3,
        "petId": 12,
        "quantity": 1,
        "shipDate": "2021-09-13T12:54:23.830Z",
        "status": "placed",
        "complete": true
      }
    """
    Given path '/store/order'
    And request order
    When method POST
    Then status 200
    And match response.id == '#present'
    And match responseHeaders['Date'] == '#notnull'
    And match response.id == '#number'
    And match response.status == '#string'


  Scenario: Find purchase order by order ID
    * def orderID = 3
    Given path '/store/order/' + orderID
    When method GET
    Then status 200
    And match response.shipDate == '#notnull'
    And match response.id == orderID