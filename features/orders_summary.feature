Feature: Order Summary
	In to finish the Order process
	As a visitor
	I want to see the the order summary

Scenario: Visit Order Summary
	Given I have filled in Shipping Details, Payment Details for Order
	When I visit Order Summary
	Then I should Order Summary page


Scenario: Complete Order
	Given I have filled in Shipping Details, Payment Details for Order
	When I visit Order Summary
	When I click "Place Order" button
	Then I should See Order Complete Page	