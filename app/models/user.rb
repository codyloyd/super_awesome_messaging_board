class User < ActiveRecord::Base
  has_many :posts, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  validates_presence_of :first_name, :last_name

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    "#{first_name} #{last_name}"
  end
end
