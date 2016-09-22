class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :country
      t.string :state
      t.text :address
      t.boolean :pet
      t.boolean :smoking
      t.integer :max_guest

      t.timestamps null: false
    end
    add_index :listings, :user_id
  end
end
