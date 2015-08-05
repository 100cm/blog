class AddComentsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :comments, :text
  end
end
