
Feature: All Product API

  Background:
    * def URL = 'http://localhost/2208M0/ProjectGroup4/public/test/allproducts'
    * def requestData = read('classpath:resources/requests/allProduct.json')
    * def responeData = read('classpath:resources/respones/allProduct.json')



  Scenario: 1 create a user and then get it by id
    Given url URL
    And request {}
    When method get
    Then status 200
    Then match each response.categories contains deep responeData.allProductResponse
