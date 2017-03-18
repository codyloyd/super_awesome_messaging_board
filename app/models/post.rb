class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :delete_all
  validates_presence_of :body, :title
end
