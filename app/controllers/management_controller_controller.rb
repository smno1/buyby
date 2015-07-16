class ManagementControllerController < ApplicationController
	before_action :authenticate_user!
	def offer_management
		@my_offers=current_user.offers
		@received_offers=current_user.received_offers
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
		@requests=Request.filter(params.slice(:status_id)).order('updated_at desc')
	    @request_status=Status.where(status_type: "request")
	end

	def update_request_status
		puts "======================================================"
		puts params[:request_id]
		puts params[:status_id]
		puts "======================================================"
		request=Request.find(params[:request_id])
		request.status_id=params[:status_id]
		respond_to do |format|
			if request.save
				format.html { redirect_to :back, notice: t(:updated_succ) }
				format.json {}
			else
				format.html { redirect_to :back }
				format.json {}
			end
		end
	end
end
