class AddCategoryIdToArticleCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :article_categories, :category_id, :integer
  end
end
