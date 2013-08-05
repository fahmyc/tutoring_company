class StudentsController < ApplicationController

  def create
    @student = current_admin.students.build(params[:student])
    if @student.save
      set_flash_message :notice, "Student Added!"
      expire_session_data_after_sign_in!
      respond_with resource, :location => :back
    else
      render 'static_pages/home'
    end
  end

	def index
	    @students = Student.paginate(page: params[:page])
	end

  def show
    @student = Student.find(params[:id])
  end

end