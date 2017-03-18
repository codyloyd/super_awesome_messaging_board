class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :first_name, :last_name
  has_many :posts, dependent: :delete_all
  has_many :comments, dependent: :delete_all


  def full_name
    "#{first_name} #{last_name}"
  end
end
