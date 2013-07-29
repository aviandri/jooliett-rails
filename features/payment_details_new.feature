Feature: New
	In order continue checkout process
	As a visitor 
	I want to choose my payment method

Scenario: See New Payment Method List and choose
	Given I am on payment method selection list
	When I choose payment method and click next step
	Then I should be redirected to summary page
