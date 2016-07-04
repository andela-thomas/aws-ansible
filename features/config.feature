Feature: Provision and Lauch
  Background:
    Given I aws account
    And I configure it well

  Scenario: Install Nodejs
    When I Create ami
    Then It should be successful
    And Ami should exist

