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
  end

end