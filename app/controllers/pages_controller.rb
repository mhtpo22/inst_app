class PagesController < ApplicationController
before_action :sign_in_required, only: [:show]
  def index
    if user_signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(:page => params[:page], :per_page => 10)
    end
  end
end
