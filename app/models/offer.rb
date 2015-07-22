class Offer < ActiveRecord::Base
  belongs_to :request
  belongs_to :user
  belongs_to :status
  has_many :comments
  has_many :received_comments, :class_name=>"Comment"
  has_many :received_gave_offer_comments, :class_name=>"Comment"
  scope :unread, -> {where :read=>false}
end
