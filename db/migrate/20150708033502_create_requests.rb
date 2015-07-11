class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :subject
      t.string :description
      t.references :user, index: true, foreign_key: true
      t.boolean :read

      t.timestamps null: false
    end
  end
end
