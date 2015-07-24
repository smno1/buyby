class AddAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :current_address_id, :integer
    add_column :users, :comment_notification, :boolean
    add_column :users, :offer_notification, :boolean
    add_column :users, :gender, :boolean
  end
end
