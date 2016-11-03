class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates_presence_of :title, :text, :user

  def time_since_creation
    ((Time.now - created_at)/3600).round
  end
end
