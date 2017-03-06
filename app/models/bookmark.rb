class Bookmark < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy

  before_save :format_url

  validates :url, presence: true

 private

 def format_url
   unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
     self.url = "http://#{self.url}"
   end
 end
end
