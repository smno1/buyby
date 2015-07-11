class AddOtherContactMethodToUser < ActiveRecord::Migration
	def change
		add_column :users, :other_contact_method, :string
	end
end
