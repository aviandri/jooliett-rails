Feature: New
	In order continue checkout process
	As a visitor 
	I want to fill in shipping details form

Scenario: See New Shipping Details Form
	Given I am on new shipping details page
	When I fill in the form and click action
	Then I should be redirected to payment page
