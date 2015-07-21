class Comment < ActiveRecord::Base
  belongs_to :offer
  belongs_to :user
  belongs_to :status

  scope :unread, ->(user_id) {where("comments.read=(?) and comments.user_id<>(?)",false,"#{user_id}")}
end
