class SessionsController < ApplicationController
  def new
  end

# GPT Helped me to write the create method here

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


# GPT Helped me to write this based on rubric

def destroy
  session[:user_id] = nil
  redirect_to login_path, notice: 'Logged out successfully'
end

end
  