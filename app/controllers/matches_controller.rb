class MatchesController < ApplicationController

	def create
		@match = @student.matchs.build(params[:match])

		if @match.save
    		flash[:success] = "Match Paired!"
			redirect_to admin_student_profile_path(@student.id)
	    else
	      render 'static_pages/home'
	    end
	end

end