class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lectures
  has_many :comments
  has_many :lectures, through: :comments
  GENDER_TYPES = ["Male", "Female"]
  mount_uploader :attachment, ImageUploader
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  
end
