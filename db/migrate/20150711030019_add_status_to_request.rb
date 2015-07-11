class AddStatusToRequest < ActiveRecord::Migration
  def change
    add_reference :requests, :status, index: true, foreign_key: true
  end
end
