class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [ :edit, :update, :destroy]

  def index
      @user = User.find(session[:user_id])
      @users = User.all
  end

  def new

  end

  def all
    # @users = User.all
    @users = User.all.where.not(id: current_user.friendships.pluck(:friend_id)).where.not(id: Friendship.all.where(friend_id: current_user.id).pluck(:user_id)).where.not(id: current_user.id)
    @user = User.find(session[:user_id])
  end

  def create
  user = User.new(user_params)
  if user.save
    # Friendship.create(user_id: user.id, friend_id: 0)
    session[:user_id] = user.id
    redirect_to "/users"
  else
    flash[:errors] = user.errors.full_messages
    redirect_to "/users"
    end
  end

  def show
      @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :description, :password, :password_confirmation)
  end
end
