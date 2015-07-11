class Comment < ActiveRecord::Base
  belongs_to :offer
  belongs_to :user
  belongs_to :status
end
