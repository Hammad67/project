class ArticlesController < ApplicationController


  def index


    @q =Article.ransack(params[:q])

    @article = @q.result(distinct: true)

    #@q.result.includes(:articles).page(params[:page])
    @article=Article.paginate(page:params[:page])

  end




  def new
    @article=current_user.articles.build
  end

  def create
    @article=current_user.articles.build(article_params)
    if @article.save


      redirect_to @article
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
    redirect_to @article
  end
  def show
    @article=Article.find(params[:id])
    @likes_count = Like.where(article_id: params[:id]).count
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
    params.require(:article).permit(:title, :body, :image)
  end
end
