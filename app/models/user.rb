class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :requests
  has_many :offers
  has_many :comments
  has_many :received_offers, :through=>:requests
  has_many :received_comments, :through=>:requests
  has_many :received_gave_offer_comments, :through=>:offers
end
