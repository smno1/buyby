class Product < ActiveRecord::Base
	has_one :recommend_product, :dependent=>:destroy
end
