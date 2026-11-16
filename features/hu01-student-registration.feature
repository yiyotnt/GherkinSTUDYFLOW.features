@HU01
Feature: University student registration

  Scenario: Register with valid details
    Given an unregistered student has opened the registration form
    When the user selects the student profile
    And submits all required details with a valid unused email and matching passwords
    Then StudyFlow creates an account with the student profile
    And shows a successful registration confirmation
    And the student can access the academic planning workspace

  Scenario Outline: Reject registration with invalid details
    Given the registration form is set to the student profile
    When the user submits the form with "<problem>" and all other details are valid
    Then StudyFlow displays the corresponding validation error
    And no new account is created

    Examples:
      | problem                          |
      | a required field left blank      |
      | an invalid email format          |
      | an email already registered      |
      | a password confirmation mismatch |