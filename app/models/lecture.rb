class Lecture < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :users, through: :comments
  mount_uploader :attachment, AttachmentUploader
  acts_as_votable
  validates_presence_of :title, :content, :message => "can't be blank"
end
