class User < ApplicationRecord

  attr_accessor :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  has_many :topics
  has_many :bookmarks, dependent: :destroy

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end

    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_hash).first

      # if login = conditions.delete(:login)
      #   where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
      # elsif conditions.has_key?(:username) ||
      #   conditions[:email].downcase! if conditions[:email]
      #   where(conditions.to_hash).first

      end
    end

  validates :username, presence: true, length: {maximum: 255}, uniqueness: { case_sensitive: false }, format: { with: /\A[a-zA-Z0-9]*\z/, message: "may only contain letters and numbers." }

  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }
end
