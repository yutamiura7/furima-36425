class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :itemname, null: false
      t.text :text, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :load_id, null: false
      t.integer :area_id, null: false
      t.integer :shippingday_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
