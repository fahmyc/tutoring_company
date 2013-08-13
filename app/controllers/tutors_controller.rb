class TutorsController < ApplicationController
  before_filter :authenticate_admin_or_tutor!

  def create
   # @tutor = current_admin.tutors.build(params[:tutor])
    #if @tutor.save
     # flash[:success] = "Tutor added!"
      #redirect_to admin_path(current_admin)
    #else
    #  render 'static_pages/home'
    #end

    ##SEE REGISTRATIONS CONTROLLER
  end

	def index
	 @tutors = Tutor.paginate(page: params[:page])
	end

  def show
    @tutor = Tutor.find(params[:id])

    @tutor_first_sessions = FirstSession.find(:all, :conditions => { :tutor_id => @tutor.id, :result_of_first_session => nil })
  end
end
