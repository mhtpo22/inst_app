class UsersController < ApplicationController
  before_action :correct_user,   only: [:edit, :update]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(userid: params[:userid])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def following
    @title = "Following"
    @user  = User.find_by(userid: params[:userid])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user  = User.find_by(userid: params[:userid])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(
        :name, :email, :password, 
        :password_confirmation,:profileimage)
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
