class PagesController < ApplicationController

  def index
    if user_signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
    @users = User.search(params[:search])
  end

end
