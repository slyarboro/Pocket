# class User < ApplicationRecord
#
#   devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :trackable, :validatable
#   has_many :topics
#   has_many :bookmarks, dependent: :destroy
# end
#

#
#
#
#
#
class User < ApplicationRecord


  devise :database_authenticatable, :confirmable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]


  attr_accessor :login

  #
  has_many :topics
  has_many :bookmarks
  # has_many :bookmarks, dependent: :destroy

  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }

validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true


validates :name, :presence => true

  def self.find_for_database_authentication(warden_conditions)
       conditions = warden_conditions.dup
       if login = conditions.delete(:login)
         where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
       elsif conditions.has_key?(:username) || conditions.has_key?(:email)
         where(conditions.to_hash).first
       end
   end

 end
