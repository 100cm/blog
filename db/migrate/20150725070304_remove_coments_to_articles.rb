class RemoveComentsToArticles < ActiveRecord::Migration
  def change

    remove_column :articles ,:comments, :string
  end
end
