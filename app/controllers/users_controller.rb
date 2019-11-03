class UsersController < ApplicationController
  before_action :set_users, only: [:show,:edit,:update]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザー登録が完了しました'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_users
    @user = User.find(params[:id])
  end

  def useer_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
