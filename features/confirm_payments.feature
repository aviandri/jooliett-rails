Feature: Show
	In order to confirm my purchase
	As a visitor 
	I want to see confirm order page

Scenario: See Confirm Order Page
	Given I have a pending order
	When I visit confirmation page
	Then I should see confirmation page details
