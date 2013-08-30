class StudentsController < ApplicationController

  def create
  #  @student = current_admin.students.build(params[:student])
   # if @student.save
    #  set_flash_message :notice, "Student Added!"
     # expire_session_data_after_sign_in!
      #respond_with resource, :location => admin_student_profile_path(@student)
    #else
    #  render 'static_pages/home'
    #end

    ## SEE REGISTRATIONS CONTROLLER!!
  end

	def index
	    @students = Student.paginate(page: params[:page])
	end

  def show
    @student = Student.find(params[:id])

    @contracts_with_sessions = Contract.find(:all, :conditions => ["hours_left > ?", 0 ])
    @contracts_with_sessions_ids = @contracts_with_sessions.collect(&:id)

    @student_contract = Contract.find(:all, :conditions => { :student_id => @student.id, :id => @contracts_with_sessions_ids })

##In case students pay for multiple contracts at the same time
    if @student_contract.count<2 && @student_contract.count>0
      for x in @student_contract
        a = x.id
      end
      @correct_contract = Contract.find(a)
    end

    if @student_contract.count>1
      counter = 0
      for x in @student_contract
        hours_left = x.hours_left
        counter = counter + hours_left.to_f
      end
      @hours_remaining_in_multiple_contracts = counter
    end

    @all_students_contracts = Contract.find(:all, :conditions => {:student_id => @student.id})
    @last_contract = @all_students_contracts.last
    @hours_in_arrears = @last_contract.hours_left.to_i.abs

    
  end

  def student_sessions
    @student = Student.find(params[:id])

    @student_sessions = TutorSession.find(:all, :conditions => { :student_id => @student.id })
  end

  def your_tutors
    @student = Student.find(params[:id])

    @matches = Match.find(:all, :conditions => { :student_id => @student.id})
    @tutor_ids = @matches.collect(&:tutor_id)
    @tutors = Tutor.find(:all, :conditions => { :id => @tutor_ids })
  end

  def update
  end

end