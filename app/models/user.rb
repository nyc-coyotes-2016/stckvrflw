class User < ActiveRecord::Base
  # Remember to create a migration!
  has_secure_password

  has_many :answers
  has_many :questions
  has_many :comments
  has_many :votes

  validates :username, :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end
