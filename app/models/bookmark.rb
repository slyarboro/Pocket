class Bookmark < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  before_save :format_url

  validates :url, :presence => true

# end



   private

   def format_url
     unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
       self.url = "http://#{self.url}"
     end
   end
  end


#
#
#
# class Bookmark < ApplicationRecord
#   belongs_to :topic
#   belongs_to :user
#
#   validates :url, presence: => true
#   validates :topic, presence: => true
#   # validates :user_id, presence: => true
#
#   # @bookmark.user = current_user
# end
