Feature: Product Details
	In Order to see the detail of a product
	As a visitor
	I want to see the detail page of a product

Scenario: Visit a Product detail page
	Given I am in Product list page of category Dress
	When I click on a product with name "Sophitix" 
	Then I should see the detail of the product

Scenario: Visit a Product detail page discounted price
	Given I am in Product list page of category Dress
	When I click on a product with name "Sophitix" that is discounted 
	Then I should see the detail of the discounted product


Scenario: Visit a Product detail page out of stock
	Given I am in Product list page of category Dress
	When I click on a product with name "Sophitix" that is out of stock 
	Then I should see the detail of out of stocked product


