class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :string
      t.string :text
      t.string :text
      t.string :author
      t.string :string
      t.string :blogtype
      t.string :string

      t.timestamps null: false
    end
  end
end
