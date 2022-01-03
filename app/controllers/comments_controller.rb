class CommentsController < ApplicationController
  def new
    @comment = current_user.comment.build
  end

  def create
    @article = Article.find(params[:article_id])
    @comment =@article.comments.create(comments_params)
    # @comment.user_id=current_user.id
    #
          @comment.user_id=current_user.id
          @comment.save
    if @current_user.id==@comment.user_id
      flash[:notice] = "Your commment could not be saved. Please make sure to submit valid input only!"

      end


    redirect_to @article
  end

def edit
  @article = Article.find(params[:article_id])
  @comment = @article.comments.find(params[:id])
end

def update
  @article = Article.find(params[:article_id])
  @comment = @article.comments.find(params[:id])
  @comment.update(comments_params)
  redirect_to @article

end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path
    end

def comments_params
  params.require(:comment).permit(:commenter, :body)
end
  end