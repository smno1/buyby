class ChangeOfferDescriptionType < ActiveRecord::Migration
  def change
  	change_column :offers, :description,  :text
  end
end
