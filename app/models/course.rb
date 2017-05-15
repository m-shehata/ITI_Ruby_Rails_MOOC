class Course < ActiveRecord::Base
  has_many :lectures, :dependent => :destroy
  validates :title, presence: true, uniqueness: true
  validates_associated :lectures
end
