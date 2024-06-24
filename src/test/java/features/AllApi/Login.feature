Feature: User login

  Scenario: Successful login
    Given url baseUrl
    And path '/login'
    And request { "email": "karate@gmail.com", "password": "1" }
    When method post
    Then status 200
    And match response contains { "user": { "user_id": "#notnull","avatar": "#? _ == null || _ != null","role": "#? _ == null || _ != null", "name": "#notnull", "code": "#notnull" }, "token": { "refeshToken": "#notnull", "accessToken": "#notnull" } }
    * def accessToken = response.token.accessToken
    * def userId = response.user.user_id
    * karate.set('userId', userId)
    * karate.set('accessToken', accessToken)
