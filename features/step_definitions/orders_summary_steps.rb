def create_user
	 @user ||= { :name => "Testy McUserton", :email => "example@example.com",
    :password => "changeme", :password_confirmation => "changeme" }
     FactoryGirl.create(:user, @user)
end

def sign_in
	visit '/users/sign_out'
	create_user
	visit '/users/sign_in'
	fill_in "user_email", :with => @visitor[:email]
  	fill_in "user_password", :with => @visitor[:password]
  	click_button "Sign in"
end

Given(/^I have filled in Shipping Details, Payment Details for Order$/) do  	
  @order_item = FactoryGirl.create(:order_item)	
  @order = FactoryGirl.create(:order, order_items: [@order_item])
  @order.shipping_detail = FactoryGirl.create(:shipping_detail)

  @order.payment_detail = FactoryGirl.create(:payment_detail)
  sign_in
  @order.user = @user
  @order.save
end

When(/^I visit Order Summary$/) do
  visit "/orders/#{@order.id}/summary"
end

Then(/^I should Order Summary page$/) do
  within "table:nth-of-type(1)" do
  	page.should have_content @order_item.product.name
  	page.should have_content @order_item.product.price
  	page.should have_content @order.total_price
  	page.should have_content @order.payment_detail.pay_code
  end

  within "table:nth-of-type(2)" do
  	page.should have_content @order.shipping_detail.address1
  end

  within "table:nth-of-type(3)" do
  	page.should have_content @order.payment_detail.payment_type.name
  end
end

When(/^I click "(.*?)" button$/) do |arg1|
	click_button arg1
end

Then(/^I should See Order Complete Page$/) do
  	page.should have_content "Order Complete"
end

