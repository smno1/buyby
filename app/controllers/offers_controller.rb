class OffersController < ApplicationController
	before_action :authenticate_user!
	def new
		@offer=Offer.new
	end

	def index
		@offers=Offer.where(:request_id=>params[:request_id])
	end

	def create
		@offer=Offer.new(offer_params)
		respond_to do |format|
			if @offer.save
				format.html { redirect_to @offer.request, notice: 'Offer was successfully created.' }
				format.json { render :show, status: :created, location: @offer }
			else
				format.html { render :new }
				format.json { render json: @offer.errors, status: :unprocessable_entity }
			end
		end
		
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
    	@offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
    	params.require(:offer).permit(:subject, :description, :user_id, :read, :request_id,:price)
    end
end
