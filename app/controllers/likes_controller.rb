class LikesController < ApplicationController
  def create
    @like = Like.create(userid: current_user.id, micropost_id: params[:micropost_id])
    @likes = Like.where(micropost_id: params[:micropost_id])
    @microposts = Micropost.all
     respond_to do |format|
        redirect_to "/"
        format.js
    end
  end

  def destroy
    like = Like.find_by(userid: current_user.id, micropost_id: params[:micropost_id])
    if like.present?
    like.destroy
    end
    @likes = Like.where(micropost_id: params[:micropost_id])
    @microposts = Micropost.all
    respond_to do |format|
  redirect_to "/"
      format.js
    end
  end
end
