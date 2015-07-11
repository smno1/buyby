class ManagementControllerController < ApplicationController
	before_action :authenticate_user!
	def offer_management
		@my_offers=current_user.offers
		@offers=Offer.all
	end

	def user_management
		if params[:user_id].blank?
			@users=User.all
		else
			@users=User.where(:id=>params[:user_id])
		end
	end

	def request_management
		@requests=Request.all.order('updated_at desc')
	end
end
