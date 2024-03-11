class UsersController < ApplicationController
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  
def new
    @user = User.new
end

# app/controllers/users_controller.rb Edits from GPT 4

def create
  @user = User.new(user_params)
  if @user.save
    # Log the user in or redirect to the login page
    session[:user_id] = @user.id  # Optional: Automatically log in
    redirect_to root_path, notice: 'User was successfully created.'
  else
    render :new
  end
end

private

def user_params
  params.require(:user).permit(:username, :email, :password)
end


end
