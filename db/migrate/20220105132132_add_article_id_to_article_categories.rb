class AddArticleIdToArticleCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :article_categories, :article_id, :integer
  end
end
