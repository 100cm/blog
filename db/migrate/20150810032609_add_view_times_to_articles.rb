class AddViewTimesToArticles < ActiveRecord::Migration
  def change
    add_column :articles ,:viewtimes,:integer,:null => 0, :default => 0

  end
end
