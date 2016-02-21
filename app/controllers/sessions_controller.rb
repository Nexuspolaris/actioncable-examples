class SessionsController < ApplicationController
  skip_before_action :ensure_authenticated_user, only: %i( new create )

  def new
    @users = User.all
    @user = User.new
  end

  def create
    if params[:user].present? then
      @user =  User.new(user_params)
      @user.save
      user_id = @user.id
    else
      user_id = params[:user_id]
    end
    authenticate_user(user_id)
    redirect_to examples_url
  end

  def destroy
    unauthenticate_user
    redirect_to new_session_url
  end
  def user_params
    params.require(:user).permit(:name)
  end
end