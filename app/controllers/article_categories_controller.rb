class ArticleCategoriesController < ApplicationController
  def index
    #@category=Category.all
  end
  def new
    @category=ArticleCategory.new

    @category.save

  end
  def create

  end
end
