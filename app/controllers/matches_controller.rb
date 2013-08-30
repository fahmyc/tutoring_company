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

	def index
		@matches = Match.all
	end

	def edit_match
		@match = Match.find(params[:id])
		@wages = [20, 22.50, 25, 27.50, 30, 32.50, 35]
	end

	def update
		@match = Match.find(params[:id])

		@match.update_attributes(wage: params[:match][:wage])

		redirect_to matches_path
	end

end