class AddColumnToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :comments, :string

  end
end
