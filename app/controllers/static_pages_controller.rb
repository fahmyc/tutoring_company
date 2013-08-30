class StaticPagesController < ApplicationController
  
  def home
  	if admin_signed_in?
  		redirect_to admin_home_path(current_admin)
  	end

  	if student_signed_in?
  		redirect_to student_path(current_student)
  	end

  	if tutor_signed_in?
  		redirect_to tutor_path(current_tutor)
  	end
  end
  
end
