class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :img_url
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
