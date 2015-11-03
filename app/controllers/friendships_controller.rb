class FriendshipsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]
  def create
    connect1 = Friendship.create(user_id: session[:user_id], friend_id: params[:id], status:'false')
    # connect1 = Friendship.create(user_id: params[:id], friend_id: session[:user_id], status:'pending')
    # connect2 = Friendship.find_by(user_id: params[:id], friend_id:0)
    # user2 = User.find(params[:id])
    # current = Friendship.find_by(user_id: session[:user_id], friend_id:0)
    # user_current = User.find(session[:user_id])
    # if user_current.friendships.count > 1
    #   current.update(user_id: session[:user_id], friend_id: 0, status:'pending')
    # else
    #   current.update(user_id: session[:user_id], friend_id: 0, status:'self')
    # end
    #   if user2.friendships.count >= 1
    #     connect2.update(user_id: params[:id], friend_id: 0, status:'pending')
    #   else
    #     connect2.update(user_id: params[:id], friend_id: 0, status:'self')
    #   end
    #  connect2 = Friendship.create(user_id: params[:id], friend_id: session[:user_id], status:'pending')
    if connect1
    redirect_to '/users'
  end
  end

  def update
    friend1 = Friendship.find_by(user_id: params[:id], friend_id: session[:user_id], status:'false')
    # friend2 = Friendship.find_by(user_id: session[:user_id], friend_id: params[:id])
    Friendship.cdestoryreate(user_id: session[:user_id], friend_id: params[:id], status:'true')
    friend1.update(user_id: params[:id], friend_id: session[:user_id], status:'true')

    redirect_to '/users'
  end

  def destroy
    friend1 = Friendship.find_by(user_id: params[:id], friend_id: session[:user_id], status:'false')
    # friend2 = Friendship.find_by(user_id: session[:user_id], friend_id: params[:id])
    # friend2.update(user_id: session[:user_id], friend_id: params[:id], status:'nil')
    friend1.destroy
    redirect_to '/users'
  end

end
