class CategoriesController < ApplicationController
  def index
    @category=Category.all
  end
  def new
    @category=Category.new
  end
  def create
    @category=Category.create(category_params)
  end

  def category_params
    params.require(:categories).permit(:name)
  end
end
