class CreatePostImages < ActiveRecord::Migration
  def change
    create_table :post_images do |t|
      t.integer :user_id, :null => false
      t.text :image
      t.timestamps null: false
    end
  end
end
