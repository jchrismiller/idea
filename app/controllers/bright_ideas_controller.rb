class BrightIdeasController < ApplicationController
	def index
		@bright_ideas = BrightIdea.all
		@likes = Like.all
		render 'index'
	end

	def create
		BrightIdea.create(bright_idea_params)

		return redirect_to '/home'
	end

	def show
		@bright_idea = BrightIdea.find_by_id(params[:id])
		@bright_ideas = BrightIdea.all
		render 'show'
	end

	def destroy
		bright_idea = BrightIdea.find_by_id(params[:id])
		bright_idea.destroy
		return redirect_to '/home'
	end

end
