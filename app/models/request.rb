class Request < ActiveRecord::Base
	include Filterable
	belongs_to :user
	has_many :received_offers, :class_name=>"Offer"
	has_many :received_comments, :through=>:offers
	has_many :offers, :dependent=>:destroy
	has_one :status

	scope :status_id, ->(status_id) {where :status_id=>status_id}
end
