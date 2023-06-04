
Feature: create User API

  Background:
    * def URL = 'http://localhost/2208M0/ProjectGroup4/public/allproducts'
    * def requestData = read('classpath:resources/requests/createUsers.json')
    * def responeData = read('classpath:resources/respones/createUsers.json')



@create
  Scenario: 1 create a user and then get it by id
    Given url URL
    # And path 'users'
    And request requestData.createUsersRequest
    When method get
    Then status 200
    Then match response == responeData.createUsersRespone
