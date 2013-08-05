class TutorsController < ApplicationController

  def create
    @tutor = current_admin.tutors.build(params[:tutor])
    if @tutor.save
      flash[:success] = "Tutor added!"
      redirect_to admin_path(current_admin)
    else
      render 'static_pages/home'
    end
  end

	def index
	    @tutors = Tutor.paginate(page: params[:page])
	end

  def show
    @tutor = Tutor.find(params[:id])
  end
end
