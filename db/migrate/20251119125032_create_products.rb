class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.integer :stock
      t.boolean :active
      t.string :image_url
      t.decimal :rating_rate
      t.integer :rating_count
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
