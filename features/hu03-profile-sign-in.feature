@HU03
Feature: Sign in according to user profile

  Scenario Outline: Open the workspace for the registered profile
    Given a registered "<profile>" is on the sign-in page
    When the user signs in with the correct email and password
    Then StudyFlow authenticates the user
    And redirects the user to the "<workspace>"

    Examples:
      | profile | workspace                    |
      | student | academic planning workspace  |
      | tutor   | student monitoring workspace |

  Scenario Outline: Reject invalid credentials
    Given the user is on the sign-in page
    When the user submits credentials with "<problem>"
    Then StudyFlow shows an invalid credentials message
    And the user remains on the sign-in page
    And no authenticated session is created

    Examples:
      | problem                                         |
      | an unregistered email                           |
      | a registered email paired with a wrong password  |