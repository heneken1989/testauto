@AllApi
Feature: Check out API tests

    Background:
        * def requestData = read('classpath:resources/requests/checkout.json')
        * def responeData = read('classpath:resources/respones/allResponse.json')
        * def loginResponse = karate.callSingle('classpath:features/AllApi/Login.feature')
        * def OngoingResponse = karate.callSingle('classpath:features/AllApi/OngoingClass.feature')
        * def accessToken = loginResponse.accessToken
        * def userId = loginResponse.userId
        * def classId = OngoingResponse.classId
        * def OngoingStudentClassId = OngoingResponse.ListStudentClassId
        * def unpaidClass = OngoingResponse.UnpaidstudentClassId
 


    Scenario: Take All category
        Given url baseUrl + '/listcate'
        And header Authorization =  'Bearer ' + accessToken
        And request {}
        When method get
        Then status 200

    Scenario: get Ongoing CLass
        Given url baseUrl + '/Ongoing'
        And header Authorization =  'Bearer ' + accessToken
        And request { StudentId: '#(userId)' }
        When method post
        Then status 200
        Then match response contains  responeData.studentClassResponse


    Scenario: Successfull  Cancel first Class on List OngGoing Class Of Student
        Given url baseUrl + '/cancelClass'
        And header Authorization =  'Bearer ' + accessToken
        And request { ClassId: '#(OngoingStudentClassId)' }
        When method post
        Then status 202
    
    Scenario: Student Unnable To Cancel  Class on List OngGoing Class Cause Status not Match
        Given url baseUrl + '/cancelClass'
        And header Authorization =  'Bearer ' + accessToken
        And request { ClassId: '#(unpaidClass)' }
        When method post
        Then status 406
    


    Scenario: Successfull Register Class
        Given url baseUrl + '/ClassRegister'
        And header Authorization =  'Bearer ' + accessToken
        And request { classId: '#(classId)' , userId:'#(userId)' }
        When method post
        Then status 201

    Scenario: Student Unable to Register Class Cause Conflict Time Slot
        Given url baseUrl + '/ClassRegister'
        And header Authorization =  'Bearer ' + accessToken
        And request { classId: '#(classId)' , userId:'#(userId)' }
        When method post
        Then status 409





