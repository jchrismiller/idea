class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
  	return User.find(session[:user_id]) if session[:user_id]
  end

 	def user_params
		params.require(:user).permit(:first_name, :last_name, :company, :email, :password, :password_confirmation)
	end

	def bright_idea_params
    		params.permit(:content, :user_id)
  end

  def like_params
        params.permit(:bright_idea_id, :user_id)
  end

end
