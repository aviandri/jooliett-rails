Feature: Show
	In order to proceed with checkout process
	As a visitor 
	I want to see a list of products in my Cart

Scenario: See Products With Category Dress
	Given I have a products in my Cart
	When I visit '/carts/{id}'
	Then I should see product details in my cart

Scenario: Delete cart item
	Given I have a products in my Cart
	When I visit '/carts/{id}'
	When I click on "Remove Item"
	Then I should see that a product is removed from my Cart