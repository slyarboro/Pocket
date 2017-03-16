class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
        
  has_many :topics
  has_many :bookmarks
  has_many :likes, dependent: :destroy

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end
end
