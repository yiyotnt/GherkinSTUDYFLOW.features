@HU02
Feature: Tutor registration

  Scenario: Register with valid details
    Given an unregistered tutor has opened the registration form
    When the user selects the tutor profile
    And submits all required details with a valid unused email and matching passwords
    Then StudyFlow creates an account with the tutor profile

  Scenario Outline: Reject registration with invalid details
    Given the registration form is set to the tutor profile
    When the user submits the form with "<problem>" and all other details are valid
    Then StudyFlow displays the corresponding validation error
    And no new account is created

    Examples:
      | problem                          |
      | a required field left blank      |
      | an invalid email format          |
      | an email already registered      |
      | a password confirmation mismatch |