Given(/^I have a pending order$/) do
  @product = FactoryGirl.create(:product)
  @master_product = FactoryGirl.create(:master_product, :products => [@product])
  @order_item = FactoryGirl.create(:order_item, :product => @product, :quantity => 1)
  @order = FactoryGirl.create(:order, :order_items => [@order_item])
end

When(/^I visit confirmation page$/) do
  visit '/payment_confirmation/aaaaaa'
end

Then(/^I should see confirmation page details$/) do
  pending # express the regexp above with the code you wish you had
end