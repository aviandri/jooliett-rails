Feature: Index
	In Order to contine my purchase on Cart Index
	As a visitor 
	I want to see list of products I have on my Cart

@javascript
Scenario: See Products With Category Dress
	Given I am in Jooliett site
	When I click on button "View Shopping Cart" at the menu bar
	Then I should see all the Products I have on my Cart
