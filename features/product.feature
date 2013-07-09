Feature: Index
	In Order to see the items available in Jooliett
	As a visitor 
	I want to see list of products

Scenario: See Products With Category Dress
	Given I am in Jooliett site
	When I click on "Dress" at the menu bar
	Then I should see products with category dress


Scenario: See Products Details
	Given I am in Jooliett site
	When I click on "Dress" at the menu bar
	Then I should see "one" dress item with name "Something", price "Something" and Photo URL "something"