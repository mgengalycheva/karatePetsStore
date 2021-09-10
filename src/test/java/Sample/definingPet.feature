Feature: defining pet
  Scenario: defining and printing

    Given def jsonObject =
    """
    [
     {
      "id": 1,
      "name": "Willy",
      "age": 5
     },
     {
      "id": 2,
      "name": "Sam",
      "age": 4
     }
    ]
    """

    * print jsonObject[1].name, jsonObject[1].age
