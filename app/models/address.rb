class Address < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :state, :city, :street, :postcode

  def full_address
    "#{state} #{city} #{street} #{postcode}"
  end
end
