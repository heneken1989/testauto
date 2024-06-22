Feature: User login

  Scenario: Successful login
    Given url baseUrl
    And path '/login'
    And request { "email": "st@gmail.com", "password": "1" }
    When method post
    Then status 200
    And match response contains { "user": { "user_id": "#notnull","avatar": "#? _ == null || _ != null","role": "#? _ == null || _ != null", "name": "#notnull", "code": "#notnull" }, "token": { "refeshToken": "#notnull", "accessToken": "#notnull" } }
    * def accessToken = response.token.accessToken
    * print 'Access Token: ' + accessToken
    * karate.set('accessToken', accessToken)
