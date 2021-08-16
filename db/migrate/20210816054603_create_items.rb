class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :itemname
      t.text :text
      t.integer :category_id
      t.integer :status_id
      t.integer :load_id
      t.integer :area_id
      t.integer :shipping_day_id
      t.integer :price
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
