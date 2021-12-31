class LikesController < ApplicationController
  def new
    @likes=current_user.build
  end

  def create

    @article=Article.find(params[:article_id])


    @like=@article.likes.create()
    @like.user_id=current_user.id
    @like.count=1
    @like.save
    redirect_to root_path
  end
  #def like_params
  # params.require(:like).permit(:count)
  #end
end
