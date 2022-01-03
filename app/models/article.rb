class Article < ApplicationRecord
  has_rich_text :body
  belongs_to :user
  has_many :comments
  has_many :likes
end
