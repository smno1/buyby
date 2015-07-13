class CreateRecommendProducts < ActiveRecord::Migration
  def change
    create_table :recommend_products do |t|
      t.references :product, index: true, foreign_key: true
      t.boolean :active
      t.string :reason

      t.timestamps null: false
    end
  end
end
