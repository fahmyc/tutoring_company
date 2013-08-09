class ContractsController < ApplicationController

	def student_contract_edit
		@student = Student.find(params[:student_id])
		@contract = @student.contracts.build(params[:contract])

		@tutors = Tutor.all
  		@tutor_names = @tutors.collect(&:id)

	end

	def create
		@student = Student.find(params[:contract][:student_id])
		@contract = @student.contracts.build(params[:contract])

		#REMOVE DUPLICATIONS!!!!
		@duplicate_match = Match.find(:all, :conditions => { :student_id => params[:contract][:student_id], :tutor_id => [ params[:contract][:tutor_1_id], params[:contract][:tutor_2_id], params[:contract][:tutor_3_id]] })

		if !@duplicate_match.any?
			if params[:contract][:tutor_2_id].nil?
		    	@match = Match.new(params[:match])
		    	@match.student_id = params[:contract][:student_id]
		    	@match.tutor_id = params[:contract][:tutor_1_id]
		    	@match.save

			elsif params[:contract][:tutor_3_id].nil?
		    	@match = Match.new(params[:match])
		    	@match.student_id = params[:contract][:student_id]
		    	@match.tutor_id = params[:contract][:tutor_1_id]
		    	@match.save

		    	@match1 = Match.new(params[:match])
		    	@match1.student_id = params[:contract][:student_id]
		    	@match1.tutor_id = params[:contract][:tutor_2_id]
		    	@match1.save
		
			else 
		    	@match = Match.new(params[:match])
		    	@match.student_id = params[:contract][:student_id]
		    	@match.tutor_id = params[:contract][:tutor_1_id]
		    	@match.save

		    	@match1 = Match.new(params[:match])
		    	@match1.student_id = params[:contract][:student_id]
		    	@match1.tutor_id = params[:contract][:tutor_2_id]
		    	@match1.save

		    	@match2 = Match.new(params[:match])
		    	@match2.student_id = params[:student_id]
		    	@match2.tutor_id = params[:contract][:tutor_3_id]
		    	@match2.save
		    end
		end


    	if @contract.save
    		flash[:success] = "Contract Added!"
    		redirect_to admin_student_profile_path(@student.id)
	    else
	      render 'static_pages/home'
	    end
	end

	def contract_notes
		@contract = Contract.find(params[:contract_id])
	end

end