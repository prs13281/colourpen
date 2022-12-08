class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null:false
      t.string :title, null:false, default:""
      t.string :place
      t.string :tag_list
      t.text :introduction, null:false
      # 緯度経度のカラム
      t.decimal :latitude, :precision => 9, :scale => 6
      t.decimal :longitude, :precision => 9, :scale => 6
      t.timestamps
    end
  end
end
