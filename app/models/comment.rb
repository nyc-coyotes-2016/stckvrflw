class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :voteable

  validates_presence_of :user, :text, :commentable

  def time_since_creation
    ((Time.now - created_at)/3600).round
  end
end
