Feature: User changes email address
  In order to change the email address associated with me in Kassi
  As a user
  I want to be able to change my email address
  
  @javascript
  Scenario: Changing email address successfully
    Given there are following users:
      | person | 
      | kassi_testperson1 |
    And I am logged in as "kassi_testperson1"
    When I follow "Settings"
    And I follow "Account"
    And I follow "account_email_link"
    And I fill in "person_email" with random email
    And I press "Save"
    And I follow "account_email_link"
    Then I should see "Information updated" within "#notifications"
    And the "person_email" field should contain the email I gave
    
  @javascript
  Scenario: Trying to update email address with false information
    Given there are following users:
      | person | 
      | kassi_testperson1 |
    And I am logged in as "kassi_testperson1"
    When I follow "Settings"
    And I follow "Account"
    And I follow "account_email_link"
    And I fill in "person_email" with "this is not email"
    And I press "Save"
    Then I should not see "Information updated" within "#notifications"
    And I should see "Please enter a valid email address." within ".error_account"
  
  
  

  
