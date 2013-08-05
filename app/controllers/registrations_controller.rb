class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource

    if resource.save
      flash[:success] = "User Added!"
      expire_session_data_after_sign_in!
      respond_with resource, :location => admin_home_path(current_admin)
  	else
      render 'static_pages/home'
    end
  end

#def new
#	@courses = ["Grade 1-6 (except French)", "Grade 7 Math","Grade 8 Math", "Grade 9 Math", "Grade 10 Math", "Grade 11 Math", "Grade 12 Math", "Grade 7 Science", "Grade 8 Science", "Grade 9 Science", "Grade 10 Science", "Grade 1-8 French", "Grade 9-12 French", "Grade 1-8 English", "Grade 9-12 English", "Grade 11 Chemistry", "Grade 12 Chemistry", "Grade 11 Biology", "Grade 12 Biology", "Grade 11 Physics", "Grade 12 Physics", "Grade 9-12 Religion", "Grade 9-12 Geography", "Grade 9-12 History", "Grade 9-12 Economics", "Grade 9-12 Business" ]
#end
#
#def edit
#	after_update_path_for(current_student)
#end

  protected

    #def after_sign_up_path_for(current_student)
    #  @students = current_student
    #end

   # def after_sign_up_path_for(current_tutor)
     # @tutors = current_tutor
    #end

end