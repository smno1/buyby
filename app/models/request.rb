class Request < ActiveRecord::Base
  belongs_to :user
  has_many :received_offers, :class_name=>"Offer"
  has_many :offers
end
