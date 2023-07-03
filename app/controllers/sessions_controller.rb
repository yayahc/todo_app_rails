class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    email = user_params[:email].downcase
    @user = User.find_by(email: email)    
    if @user && @user.is_password?(user_params[:password])
        session[:user_id] = @user.id
        redirect_to todos_path
    else
        flash.now[:notice] = "Invalid Email or Password"
        render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
