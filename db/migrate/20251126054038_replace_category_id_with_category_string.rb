class ReplaceCategoryIdWithCategoryString < ActiveRecord::Migration[7.1]
  def change
    # Remove the connection to the old Categories table
    remove_reference :products, :category, foreign_key: true, index: false

    # Add the new simple String column
    add_column :products, :category, :string

    # Delete the old Categories table entirely
    drop_table :categories do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
