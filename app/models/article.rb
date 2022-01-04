class Article < ApplicationRecord
  has_rich_text :body
  belongs_to :user
  has_many :comments
  has_many :likes
  has_one_attached :image
  self.per_page=2

  def self.search(search)
    Article.where("title LIKE ?", "%#{search}%")
  end
  end