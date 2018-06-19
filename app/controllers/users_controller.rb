class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  before_action :require_sign_in!, only: [:destroy]
  before_action :set_user, only: [:session_create]
  def index
    @user = User.new
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path
    else
      render 'new'
    end
  end

  def session_create
    if @user.authenticate(session_params[:password])
      sign_in(@user)
      redirect_to root_path
    else
      flash.now[:danger] = t('.flash.invalid_password')
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :mail, :password)
  end

  def set_user
    @user = User.find_by!(authenticate_key: session_params[:authenticate_key])
  rescue
    flash.now[:danger] = t('.flash.invalid_mail')
    render action: 'new'
  end

  def session_params
    params.require(:session).permit(:authenticate_key, :password)
  end
end
