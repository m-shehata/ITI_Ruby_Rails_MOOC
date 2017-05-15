class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :lecture
  validates_presence_of :content, :message => "can't be blank"
end
