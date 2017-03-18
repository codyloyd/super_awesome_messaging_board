class Post < ActiveRecord::Base
  extend FriendlyId

  belongs_to :user
  has_many :comments, dependent: :delete_all
  
  validates_presence_of :body, :title
  friendly_id :title
end
