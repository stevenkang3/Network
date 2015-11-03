class User < ActiveRecord::Base
  has_secure_password
  has_many :friendships
  has_many :friends, :through => :friendships

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true
  validates :description, presence: true
  validates :email, presence: true
  validates :email, format: { with: EMAIL_REGEX }
  validates :email, :uniqueness => { :case_sensitive => false }
end
