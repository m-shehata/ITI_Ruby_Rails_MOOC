class Lecture < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments
  mount_uploader :attachment, AttachmentUploader
  acts_as_votable
end
