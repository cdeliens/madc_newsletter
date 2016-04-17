Feature: Login to MADC Newsletter
As an Admin User
I want to be able to login into the application
So that only with an user and password Im able to use the application

Scenario: Unsuccessful login
    Given an admin user
    When the user tries to log in with invalid information
    Then the user should see an log in error message

Scenario: Successful login
   Given an admin user
   When the user logs in
   Then the user should see an log in success message
   And the user should see a sign out link

Scenario: Successful logout
   Given a signed in user
   Then the user logs out
   And the user should see an log out success message
