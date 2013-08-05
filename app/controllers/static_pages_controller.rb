class StaticPagesController < ApplicationController
  
  def home
  	if admin_signed_in?
  		redirect_to admin_home_path(current_admin)
  	end
  end
  
end
