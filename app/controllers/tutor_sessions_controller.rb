class TutorSessionsController < ApplicationController

	def submit_hours
		@tutor = Tutor.find(params[:tutor_id])
  		@tutor_session = current_tutor.tutor_sessions.build(params[:tutor_session])

  		@matches = Match.find(:all, :conditions => { :tutor_id => @tutor.id })
  		@student_ids = @matches.collect(&:student_id)
  		@students = Student.find(:all, :conditions => { :id => @student_ids })
  		@student_names = @students.collect(&:student_name)

  		@hours = ["8:00 am", "9:00 am", "10:00 am", "11:00 am", "12:00 pm", "1:00 pm", "2:00 pm", "3:00 pm", "4:00 pm", "5:00 pm", "6:00 pm", "7:00 pm", "8:00 pm", "9:00 pm", "10:00 pm"]
	end

	def create
		@tutor = Tutor.find(params[:tutor_session][:tutor_id])
		@tutor_session = @tutor.tutor_sessions.build(params[:tutor_session])

		hours = params[:tutor_session][:number_of_hours]

		@student = Student.find_by_student_name(params[:tutor_session][:student_name])
		@tutor_session.update_attributes(student_id: @student.id)

		@contracts_with_sessions = Contract.find(:all, :conditions => ["hours_left > ?", 0 ])
		@contracts_with_sessions_ids = @contracts_with_sessions.collect(&:id)

		@student_contract = Contract.find(:all, :conditions => { :student_id => @student.id, :id => @contracts_with_sessions_ids })

		if @student_contract.any?
			for x in @student_contract
				a = x
			end
			@correct_contract = Contract.find(a)
		end

		

		if @tutor_session.save
    		flash[:success] = "Tutoring Session Submitted!"
    		

    		if !@tutor_session.first_session? && @student_contract.any?

    			@hours_remaining = @correct_contract.hours_left - hours.to_f

    			@correct_contract.update_attributes(:hours_left => @hours_remaining)
    		end

			redirect_to :back

	    else
	      render 'static_pages/home'
	    end
	end

	def index
		@tutor_sessions = TutorSession.all


	end

#never used weekly_sessions
	def weekly_sessions
		@tutor_sessions = TutorSession.all
		@weekly_sessions = @tutor_sessions.group_by(&:week_id) 
	end
end