class Bookmark < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy

  # before_save :format_url

  validates :user, presence: true
  validates :url, presence: true
  validates :topic, presence: true

 private

 def format_url
   unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
     self.url = "http://#{self.url}"
   end
 end
end
