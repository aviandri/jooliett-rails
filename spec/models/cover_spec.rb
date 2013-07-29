require 'spec_helper'

describe Cover do
  describe "valid" do
    it "should be valid" do
      	cover = Cover.new()
      	cover.image.should_not be_nil
      	cover.status.should be_nil
      	cover.caption.should be_nil
    end
    it "should have image valid url" do
    	cover = FactoryGirl.create(:cover)
    	cover.image.url.should_not be_nil
    end 
  end

  describe "active cover" do
  	before(:each) do
  	  @cover1 = FactoryGirl.create(:cover, :status => "active")
  	  @cover2 = FactoryGirl.create(:cover)
  	end
    it "should return active covers" do
      	Cover.active.first.should eq(@cover1)
    end
  end
end
