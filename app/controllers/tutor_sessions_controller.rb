class TutorSessionsController < ApplicationController

	def submit_hours
		@tutor = Tutor.find(params[:tutor_id])
  		@tutor_session = current_tutor.tutor_sessions.build(params[:tutor_session])

  		@matches = Match.find(:all, :conditions => { :tutor_id => @tutor.id })
  		@student_ids = @matches.collect(&:student_id)
  		@students = Student.find(:all, :conditions => { :id => @student_ids })
  		@student_names = @students.collect(&:student_name)
	end

	def create
		@tutor = Tutor.find(params[:tutor_session][:tutor_id])
		@tutor_session = @tutor.tutor_sessions.build(params[:tutor_session])
		if @tutor_session.save
    		flash[:success] = "Tutoring Session Submitted!"
    		redirect_to :back
	    else
	      render 'static_pages/home'
	    end
	end
end