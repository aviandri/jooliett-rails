require 'spec_helper'

describe PaymentDetail do
  
  describe "valid" do
    it "should be valid" do
      payment_code = PaymentCode.new(:id => 22)
      payment_detail = FactoryGirl.create(:payment_detail, :payment_code => payment_code)
      payment_detail.payment_code.should eq(payment_code)
    end

    it "should give pay code" do
    	payment_code = PaymentCode.new(:id => 22)
      	payment_detail = FactoryGirl.create(:payment_detail, :payment_code => payment_code)
      	payment_detail.pay_code.should eq(22)

      	payment_code = PaymentCode.new(:id => 222)
      	payment_detail = FactoryGirl.create(:payment_detail, :payment_code => payment_code)
      	payment_detail.pay_code.should eq(22)
    end
  end
end
