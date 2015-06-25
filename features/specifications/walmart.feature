@tv
Feature: Walmart add to cart

@qaready
Scenario: Walmart TV Search add to cart basic success

Given I visit walmart.com
When I fill the search field with tv
And click on the first item suggested
Then I should be on search result page
When I click on the first TV product
Then I should be on the TV product page
When I click on the add to cart button
Then I should see the garantia estendida modal
When I click on the continuar button
And I click on the cart icon on the topbar
Then I should be on the meu carrinho page
And I should see that the product was added to the cart with success

@QAready
Scenario: Walmart TV Search add to cart success with extended 12 month warranty

Given I visit walmart.com
When I fill the search field with tv
When click on the first item suggested
Then I should be on search result page
When I click on the first TV product
Then I should be on the TV product page
When I click on the add to cart button
Then I should see the garantia estendida modal
When I select 12 meses on warranty radio button
And I click on the continuar button
And I click on the cart icon on the topbar
Then I should be on the meu carrinho page
And I should see that the product was added to the cart with success with the warranty, having 2 products
And I should see the 12 month warranty also added to the cart