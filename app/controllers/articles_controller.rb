class ArticlesController < ApplicationController
  def index
    @article=Article.all()
  end

  def new
    @article=Article.new()
  end

  def create
    @article=Article.create(article_params)
    if @article.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  def edit
    @article=Article.find(params[:id])
  end
  def destroy
    @article=Article.find(params[:id])
    @article.destroy
    redirect to @article
  end
  def update
    @article=Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
    render :new
    end
    end

  def article_params
    params.require(:article).permit(:title,:body)
  end
end
