Feature: Merge Articles
  As a blog administrator
  In order to prevent having similar articles
  I want to be able to merge articles into one
  
  Background:
    Given the blog is set up
    Given the articles are set up
    
  Scenario: A normal user can't merge articles
    Given I am logged with a normal user
    And   I am on "the edit page of article 3"
    Then  I should not see "Merge Articles"

  Scenario: Merge articles into one when I am a admin user
    Given I am logged into the admin panel
    And   I am on "the edit page of article 3"
    Then  I should see "Merge Articles"
    Then  I should see "Article ID"
    And   I fill in "merge_with" with "4"
    And   press "Merge"
    Then  I should be on the admin content page
    Then  I should see "Articles successfully merged!"

  Scenario: After a successfully merge, the author must be one of them
    Given I merge article 3 and 4
    Then  "Fulano" should be the author of article 3
    
  Scenario: After a successfully merge, the title must be one of them
    Given I merge article 3 and 4
    When  I go to the home page
    Then  I should see "Article One"
    And   I should not see "Article Two"
    
  Scenario: After a successfully merge, the body must be the merge of them
    Given I merge article 3 and 4
    When  I go to the home page
    And   I follow "Article One"
    Then  I should see "Hello"
    Then  I should see "Goodbye"
    
  Scenario: After a successfully merge, the comments must be both of them
    Given I merge article 3 and 4
    When  I go to the home page
    Then  I follow "Article One"
    Then  I should see "Comment One"
    And   I should see "Comment Two"


  