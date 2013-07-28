require 'spec_helper'

describe PaymentConfirmation do
  describe "valid" do
    it "should be valid" do
    	payment_confirmation = PaymentConfirmation.new
    	payment_confirmation.should_not be_valid
    	payment_confirmation.errors.messages.should include(:invoice_code, :account_holder, :bank_name, :amount)    
      
    end
  end
end
