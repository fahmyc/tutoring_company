class FirstSessionsController < ApplicationController

	def first_session_submission
		@student = Student.find(params[:student_id])
		@first_session = @student.first_sessions.build(params[:first_session])

		@tutors = Tutor.all
  		@tutor_ids = @tutors.collect(&:id)

  		@hours = ["8:00 am", "9:00 am", "10:00 am", "11:00 am", "12:00 pm", "1:00 pm", "2:00 pm", "3:00 pm", "4:00 pm", "5:00 pm", "6:00 pm", "7:00 pm", "8:00 pm", "9:00 pm", "10:00 pm"]
	end

	def create
		@student = Student.find(params[:first_session][:student_id])
		@first_session = @student.first_sessions.build(params[:first_session])
    	
		@duplicate_match = Match.find(:all, :conditions => { :student_id => params[:first_session][:student_id], :tutor_id => params[:first_session][:tutor_id] })
		
		if !@duplicate_match.any?
	    	@match = Match.new(params[:match])
	    	@match.student_id = params[:first_session][:student_id]
	    	@match.tutor_id = params[:first_session][:tutor_id]
	    	@match.save
    	end	

    	if @first_session.save
    		flash[:success] = "First Session Submitted!"

    		

    		redirect_to admin_student_profile_path(@student.id)
	    else
	      render 'static_pages/home'
	    end
	end

	def ten_hour
		@student = Student.find(params[:student_id])
		@first_session = FirstSession.find(params[:id])
		@first_session.update_attributes(result_of_first_session: "10 hour contract")
		
		redirect_to admin_student_profile_path(@student.id)
	end

	def twenty_hour
		@student = Student.find(params[:student_id])
		@first_session = FirstSession.find(params[:id])
		@first_session.update_attributes(result_of_first_session: "20 hour contract")
		
		redirect_to admin_student_profile_path(@student.id)
	end

	def continue_no_contract
		@student = Student.find(params[:student_id])
		@first_session = FirstSession.find(params[:id])
		@first_session.update_attributes(result_of_first_session: "Continue without contract")
		
		redirect_to admin_student_profile_path(@student.id)
	end

	def not_to_continue
		@student = Student.find(params[:student_id])
		@first_session = FirstSession.find(params[:id])
		@first_session.update_attributes(result_of_first_session: "Not to continue")
		
		redirect_to admin_student_profile_path(@student.id)
	end

	def index
		@first_sessions = FirstSession.all
	end

end