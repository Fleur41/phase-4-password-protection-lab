class SessionsController < ApplicationController
  
  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:params])
      session[:user_id] = user.user_id
      render json: user, status: :created
    else
      render json: {error: "Invalid username or password"}, status: :unauthorised

    end

  end

  def destroy
    session.delete :user_id
    head :no_content
  end
end
