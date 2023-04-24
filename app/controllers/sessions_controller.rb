class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #look if user existe
    @user = User.find_by(email: user_params[:email])

    #session then
    if @user && @user.is_password?(user_params[:password])
        session[:user_id] = @user.id
        redirect_to todos_path
    else
        flash.now[:notice] = "Bad Email or Password"
        render :new
    end
  end

  def destroy
    
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
