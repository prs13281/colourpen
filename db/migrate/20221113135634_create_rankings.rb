class CreateRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :rankings do |t|
      t.integer :comment_id
      t.integer :favourite_id
      t.integer :post_id

      t.timestamps
    end
  end
end
