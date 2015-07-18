class OffersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_offer, only: [:destroy]
	before_action :redirect_unless_dealer, only: [:new,:create,:destroy]

	def new
		@offer=Offer.new
	end

	def index
		@offers=current_user.received_offers
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

	def destroy
		@offer.destroy
		respond_to do |format|
			format.html { redirect_to :back, notice: 'Offer was successfully destroyed.' }
			format.json { head :no_content }
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
