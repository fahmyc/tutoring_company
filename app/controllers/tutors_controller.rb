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

  def your_students
    @tutor = Tutor.find(params[:id])
    @matches = Match.find(:all, :conditions => { :tutor_id => @tutor.id })

    @student_ids = @matches.collect(&:student_id)

    @students = Student.find(:all, :conditions => {:id => @student_ids})
  end

  def your_sessions
    @tutor = Tutor.find(params[:id])
    @sessions = TutorSession.find(:all, :conditions => {:tutor_id => @tutor.id})
  end

#  def edit_session
 #   @tutor = Tutor.find(params[:id])
  #  @session = TutorSession.find(params[:tutor_session_id])
#
 #   @session.update_attributes(params[:tutor_session])
#
 #   @matches = Match.find(:all, :conditions => { :tutor_id => @tutor.id })
  #  @student_ids = @matches.collect(&:student_id)
   # @students = Student.find(:all, :conditions => { :id => @student_ids })
    #@student_names = @students.collect(&:student_name)


    #@hours = ["8:00 am", "8:30 am", "9:00 am", "9:30 am", "10:00 am",  "10:30 am","11:00 am","11:30 am", "12:00 pm", "12:30 pm", "1:00 pm",  "1:30 pm", "2:00 pm",  "2:30 pm", "3:00 pm", "3:30 pm", "4:00 pm", "4:30 pm","5:00 pm", "5:30 pm","6:00 pm","6:30 pm", "7:00 pm","7:30 pm", "8:00 pm", "8:30 pm", "9:00 pm", "9:30 pm","10:00 pm"]
 # end

end
