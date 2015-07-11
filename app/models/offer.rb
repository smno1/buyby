class Offer < ActiveRecord::Base
  belongs_to :request
  belongs_to :user
  belongs_to :status
end
