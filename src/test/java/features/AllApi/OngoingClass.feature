Feature: Ongoing Class of User

  Background:
    * def loginResponse = karate.callSingle('classpath:features/AllApi/Login.feature')
    * def accessToken = loginResponse.accessToken
    * def userId = loginResponse.userId

  Scenario: get Ongoing Class
    Given url baseUrl + '/Ongoing'
    And header Authorization = 'Bearer ' + accessToken
    And request { StudentId: '#(userId)' }
    When method post
    Then status 200

    * def unpaidClass = null
    * def ongoingClass = null
    * karate.forEach(response, function(item) {if (item.status == 'LIST' || item.status == 'WAITINGLIST') {karate.set('ongoingClass', item)}});
    * karate.forEach(response, function(item) {if (item.status == 'UNPAID' || item.status == 'PAID') {karate.set('unpaidClass', item)}});
    * if (unpaidClass != null) karate.set('UnpaidstudentClassId', unpaidClass.id)
    * if (ongoingClass != null) karate.set('ListStudentClassId', ongoingClass.id)
    * if (ongoingClass != null) karate.set('classId', ongoingClass.classforSubject.id)

