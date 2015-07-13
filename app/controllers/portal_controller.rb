class PortalController < ApplicationController
  def welcome
  	@recommends=RecommendProduct.where(:active=>true)
  end
end
