Feature: Sign Up
	In order register to Jooliett
	As a visitor 
	I want to sign up to Jooliett

Scenario: Sign Up
	Given I am on the sign up page
	When I fill in form and click next step
	Then I should be redirected to cover page
