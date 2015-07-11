class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :subject
      t.string :description
      t.decimal :price
      t.boolean :read
      t.references :request, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
