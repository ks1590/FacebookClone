class UsersController < ApplicationController
  # before_action :authenticate_user, {only: [:edit, :update]}

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
      session[:user_id] = @user.id
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
        redirect_to user_path(current_user), alert: "不正なアクセスです。"
    end
  end
  
  def show
    @user = User.find(params[:id]) 
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                :password_confirmation)
  end
end
