class ApplicationController < ActionController::Base
  protect_from_forgery


def after_sign_in_path_for(resource)
   	if resource.is_a?(Student)
   		student_path(current_student)
   	elsif resource.is_a?(Tutor)
   		tutor_path(current_tutor)
   	else
   		admin_path(current_admin)
   	end
end

def authenticate_admin_or_tutor!
    if admin_signed_in?
        true
    else
        authenticate_tutor!
    end
end


#def after_sign_up_path_for(resource)
 #  	if resource.is_a?(Student)
  # 		admin_home_path(current_admin)
   #	elsif resource.is_a?(Tutor)
   #		admin_home_path(current_admin)
   #	else
   #		admin_home_path(current_admin)
   #	end
#end



end
