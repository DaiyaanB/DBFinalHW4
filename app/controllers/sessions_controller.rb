 # GPT Helped me to write these methods
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to places_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid email or password'
      render 'new'
    end
  end

  # GPT Helped me to write this based on rubric to log out a user

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path, notice: 'Logged out successfully.'
  end

end
  