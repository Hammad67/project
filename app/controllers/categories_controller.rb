class CategoriesController < ApplicationController
  def index
    @category=Category.all
  end
  def new
    @category=Category.new
  end
  def create
    @category=Category.create(category_params)



    article_ids= params[:category][:article_ids]
      article_ids.each do|f|
        if f.present?
        @article_category=ArticleCategory.new
        @article_category.article_id=f
        @article_category.category_id=@category.id
        @article_category.save
      end
    end
    if @category.save
      redirect_to @category
    else
      render "new"
  end
  end

  def show
    @category=Category.find(params[:id])
  end
  def category_params
    params.require(:category).permit(:name)
  end
end
