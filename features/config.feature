Feature: Provision and Lauch
  Background:
    Given I aws account
    And I configure it well

  Scenario: Create Ami
    When I Create ami
    Then It should be successful
    And Ami should exist

  Scenario: Launch Confuguration
    When I Launch CloudFormation
    Then It should be successful

  Scenario: Upload Website
    When I Upload the wesbsite
    Then It should be successful

