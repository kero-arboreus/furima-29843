class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name,     null: false
      t.text :description,        null: false
      t.integer :value,           null: false
      t.integer :category,        null: false 
      t.integer :state,           null: false
      t.integer :freight,         null: false
      t.integer :shipment_region, null: false
      t.integer :shipdate,        null: false
      t.references :user,         foreign_key: true
      t.timestamps
    end
  end
end
