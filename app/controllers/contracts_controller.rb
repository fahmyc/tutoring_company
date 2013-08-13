class ContractsController < ApplicationController

	def student_contract_edit
		@student = Student.find(params[:student_id])
		@contract = @student.contracts.build(params[:contract])

		@matches = Match.find(:all, :conditions => {:student_id => @student.id})
  		@tutor_ids = @matches.collect(&:tutor_id)
  		@tutors = Tutor.find(:all, :conditions => {:id => @tutor_ids})

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

	def contract_info
		@contract = Contract.find(params[:contract_id])
		@student = Student.find(@contract.student_id)
	end

	def index
		@contracts = Contract.all
	end

	def paid
		@student = Student.find(params[:student_id])
		@contract = Contract.find(params[:id])
		@contract.update_attributes(status: "paid")
		
		redirect_to admin_student_profile_path(@student.id)
	end

	def not_paid
		@student = Student.find(params[:student_id])
		@contract = Contract.find(params[:id])
		@contract.update_attributes(status: "not_paid")
		
		redirect_to admin_student_profile_path(@student.id)		
	end

	def cancelled
		@student = Student.find(params[:student_id])
		@contract = Contract.find(params[:id])
		@contract.update_attributes(status: "cancelled")
		
		redirect_to admin_student_profile_path(@student.id)		
	end

end