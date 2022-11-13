class CreateFavourites < ActiveRecord::Migration[6.1]
  def change
    create_table :favourites do |t|
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
