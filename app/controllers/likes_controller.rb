class LikesController < ApplicationController

	def create
		Like.create(like_params)
		return redirect_to '/bright_ideas'
	end
end
