class Address < ActiveRecord::Base
  belongs_to :user

  def full_address
  	"#{state} #{city} #{street} #{postcode}"
  end
end
