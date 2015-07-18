class Offer < ActiveRecord::Base
  belongs_to :request
  belongs_to :user
  belongs_to :status
  has_many :comments
  has_many :received_comments, :class_name=>"Comment"
end
