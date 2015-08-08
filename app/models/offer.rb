class Offer < ActiveRecord::Base
  belongs_to :request
  belongs_to :user
  belongs_to :status
  has_many :comments, :dependent => :destroy
  has_many :received_comments, :class_name => "Comment"
  has_many :received_gave_offer_comments, :class_name => "Comment"
  scope :unread, -> { where :read => false }

  validates_presence_of :subject, :price, :description
end
