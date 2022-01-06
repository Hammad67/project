class ArticleCategoriesController < ApplicationController
  def index
    #@category=Category.all
  end
  def new


  end
  def create
    article_ids=params[:article_category][:article_ids]
    article_ids.each do |c|
      if c.present?
        @category=ArticleCategory.new
        @category.category_id=params[:category_id]

        @category.article_id=c
        @category.save
      end
    end
  end
end
