Feature: Manage Categories
  As a blog administrator
  In order to organize my blog by categories
  I want to be able to manage categories of articles

  Background:
    Given the blog is set up
    Given I am logged into the admin panel
    And   I am on the admin content page
    Then  I follow "Categories"

  Scenario: Admin can create categories
    Then  I fill in "category_name" with "SpecialCategory"
    And   I press "Save"
    Then  I should see "Category was successfully saved."
    And   I should see "SpecialCategory"

  Scenario: Admin can edit categories
    Then  I fill in "category_name" with "SpecialCategory"
    And   I press "Save"
    And   I should see "SpecialCategory"
    Then  I follow "SpecialCategory"
    When  I fill in "category_name" with "Not such a special"
    And   I press "Save"
    Then  I should see "Category was successfully saved."
    And   I should see "Not such a special"

