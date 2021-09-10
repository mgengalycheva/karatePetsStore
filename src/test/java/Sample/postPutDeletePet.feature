Feature: create new Pet, change it and delete at the end
  Background:
    * url baseUrl

  Scenario: post data
    * def pet =
    """
    {
      "id": 11,
      "category": {
        "id": 0,
        "name": "cat"
      },
      "name": "Jasmin",
      "photoUrls": [
        "photoUrl"
      ],
      "tags": [
        {
          "id": 0,
          "name": "cute"
        }
      ],
      "status": "available"
    }
    """
    Given path '/pet'
    And request pet
    When method POST
    Then status 200


  Scenario: put data
    * def pet =
    """
    {
      "id": 11,
      "name": "Jasmin new"
    }
    """
    Given path '/pet'
    And request pet
    When method PUT
    Then status 200
    
    
  Scenario: delete pet
    Given path '/pet', 11
    When method DELETE
    Then status 200

  Scenario: get deleted pet
    Given path '/pet', 11
    When method GET
    Then status 404
