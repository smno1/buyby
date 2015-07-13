class PortalController < ApplicationController
  def welcome
  	@recommends=RecommendProduct.all
  end
end
