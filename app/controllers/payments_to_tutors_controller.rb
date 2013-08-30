class PaymentsToTutorsController < ApplicationController
	def land
		@weeks = [31,32,33,34,35,36,37,38,39,40]
	end

	def weekly_payments
		@week = params[:week]

		@sessions_this_week = TutorSession.find(:all, :conditions => { :week => @week})

		
	end

end