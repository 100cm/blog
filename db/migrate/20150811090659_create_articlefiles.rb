class CreateArticlefiles < ActiveRecord::Migration
  def change
    create_table :articlefiles do |t|
      t.text :title
      t.text :author
      t.text :file

      t.integer :user_id
      t.timestamps null: false
    end
  end
end
