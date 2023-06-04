Feature: create User API

  Background:
    * def URL = 'https://jsonplaceholder.typicode.com/users'
    * def requestData = read('classpath:resources/requests/createUsers.json')
    * def responeData = read('classpath:resources/respones/createUsers.json')




  Scenario: 1 create a user and then get it by id
    Given url baseUrl
    And path 'users'
    And request requestData.createUsersRequest
    When method post
    Then status 201
    Then match response == responeData.createUsersRespone
