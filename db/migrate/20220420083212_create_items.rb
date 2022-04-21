class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product,           null: false
      t.integer :category_id,      null: false
      t.integer :price,            null: false
      t.references :user,          null: false, foreign_key: true
      t.text :explain,             null: false
      t.integer :condition_id,     null: false
      t.integer :post_price_id,    null: false
      t.integer :region_id,        null: false
      t.integer :delivery_day_id,  null: false

      t.timestamps
    end
  end
end
