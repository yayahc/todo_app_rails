class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.email = @user.email.downcase
    if @user.save
        redirect_to '/sign_in'
    else
        flash.now[:notice] = @user.errors.full_messages.to_sentence
        render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end