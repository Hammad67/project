class LikesController < ApplicationController

  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def new
    @likes=current_user.build
  end

  def create
    @like = Like.where(user_id: current_user.id, article_id: params[:article_id])
    if @like.present?
       @like.first.destroy
       @likes_count = Like.where(article_id: params[:article_id]).count
       
    else
      @like = Like.new(user_id: current_user.id, article_id: params[:article_id])
      @like.save
      @likes_count = Like.where(article_id: params[:article_id]).count
      render json: @likes_count
    end
  end
end
