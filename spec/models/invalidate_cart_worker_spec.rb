require 'spec_helper'

describe InvalidateCartWorker do
	describe "should add job" do		
		InvalidateCartWorker.perform_async(1)
		InvalidateCartWorker.perform_in(1.hour, 2)
	end
end