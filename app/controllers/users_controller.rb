class UsersController < ApplicationController
	layout "title", only: [:new]

	def index
		@users = User.all
		@user = current_user
	end

	def new

	end

	def login

	end

	def create
		@user = params[:user] ? User.new(user_params) : User.new_guest

		if @user.save
			session[:user_id] = @user.id

			return redirect_to '/home'
		end

		flash[:errors] = @user.errors.full_messages

		return redirect_to :back
	end

	def show
		@user = User.find_by_id(params[:id])
		print @user.id, "HELLLLLLLLLLLLLLLLLLLLOOOOOOOOOOOOOOOOOOo"
		@bright_ideas = BrightIdea.where(user_id: @user.id).count

		@likes = Like.where(user_id: @user.id).count

		render 'show'

	end

	def edit
		@user = User.find_by_id( params[:id] )
		return render 'edit'
	end

	def update
		user = User.find_by_id( params[:id] )
		user.first_name = params[:first_name]
		user.last_name = params[:last_name]
		user.company = params[:company]
		user.email = params[:email]
		user.save
		redirect_to '/home'

	end

	def destroy

	end
end
