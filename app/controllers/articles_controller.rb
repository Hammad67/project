  class ArticlesController < ApplicationController

    def index
      @q =Article.ransack(params[:q])
      @article = @q.result(distinct: true).paginate(page:params[:page])
    end
    def new
      @article=current_user.articles.build
    end

    def create
      @article=current_user.articles.create(article_params)
      if @article.save
        if params[:article][:category_ids].present?
          category_ids = params[:article][:category_ids]
          category_ids.each do|n|
            if n.present?
              @article_cat = ArticleCategory.new()
              @article_cat.category_id = n
              @article_cat.article_id = @article.id
              @article_cat.save
            end
          end
        end


        
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
      @c=@article.article_categories.where(article_id:@article.id)
      @c.each do |n|
        n.destroy
      end
      @article.destroy
      #@c.destroy
      redirect_to @article
    end
    def show
      @article=Article.find(params[:id])
      @c=@article.article_categories.where(article_id:@article.id)
      @likes_count = Like.where(article_id: params[:id]).count
    end
    def update
      @article=Article.find(params[:id])
      @c=@article.article_categories.where(article_id:@article.id)
      @c.each do |n|
        if n.present?
          n.destroy
        end
        end
        category_ids=params[:article][:category_ids]
        category_ids.each do |t|
          if t.present?

            @article_category=ArticleCategory.new
            @article_category.category_id=t
            @article_category.article_id=@article.id
            @article_category.save
          end
        end
      if @article.update(article_params)
        redirect_to @article
      else
        render :new
      end
      end



    def article_params
      params.require(:article).permit(:title, :image, :body)
    end
  end
