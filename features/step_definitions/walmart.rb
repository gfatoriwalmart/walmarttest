#encoding: utf-8
#!/usr/bin/env ruby

Given(/^I visit walmart.com$/) do
  visit 'http://www.walmart.com.br/'
end

When(/^I fill the search field with tv$/) do
  fill_in 'suggestion-search', :with => "tv"
end

When(/^click on the first item suggested$/) do
  page.find(:xpath, "//ul[@class='list-suggestions']/li[1]").click
end

When(/^I should be on search result page$/) do
  expect(page).to have_content 'Resultados de busca'
end

When(/^I click on the first TV product$/) do
  page.find(:xpath, "//div[@class='if-search-department'][1]/section/ul[@class='shelf-itens two-rows clearfix']/li[2]//a[@class='product-link']").click
end 

When(/^I should be on the TV product page$/) do
  expect(page).to have_content 'Descrição do produto'
end

When(/^I click on the add to cart button$/) do
  page.find(:xpath, "//button[@class='buy-button btn btn-success']").click
end

When(/^I should see the garantia estendida modal$/) do
  expect(page).to have_content 'Garantia Estendida'
end

When(/^I click on the continuar button$/) do
  click_button 'navegaCarrinho'
end

When(/^I click on the cart icon on the topbar$/) do
  page.find(:xpath, "//a[@class='topbar-buttons open-link cart-link']").click
end

When(/^I should be on the meu carrinho page$/) do
  expect(page).to have_content 'Meu carrinho'
end

Then(/^I should see that the product was added to the cart with success$/) do
  expect(page).to have_content 'Meu carrinho (1 item)'
end

Then(/^I should see that the product was added to the cart with success with the warranty, having 2 products$/) do
  expect(page).to have_content 'Meu carrinho (2 itens)'
end

When(/^I select 12 meses on warranty radio button$/ ) do
  page.find(:xpath, "//label[text()='12 meses']/input").set(true)
end

Then(/^I should see the 12 month warranty also added to the cart$/) do
  expect(page).to have_content 'Garantia Estendida de 12 meses'
end

