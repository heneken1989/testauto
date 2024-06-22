@checkOutApi
Feature: Check out API tests

    Background:
        * def requestData = read('classpath:resources/requests/checkout.json')
        * def responeData = read('classpath:resources/respones/checkout.json')
        * def loginResponse = karate.callSingle('classpath:features/Checkpout/Login.feature')
        * def accessToken = loginResponse.accessToken
        * print 'Access Token in Background: ' + accessToken
   

    Scenario: Take All category
        Given url baseUrl + '/listcate'
        And header Authorization =  'Bearer ' + accessToken
        And request {}
        When method get
        Then status 200



    Scenario: get Ongoing CLass
        Given url baseUrl + '/Ongoing'
        And header Authorization =  'Bearer ' + accessToken
        And request {"StudentId":"3"}
        When method post
        Then status 200






