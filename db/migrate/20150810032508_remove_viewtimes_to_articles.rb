class RemoveViewtimesToArticles < ActiveRecord::Migration
  def change

    remove_column :articles ,:view_times, :string
  end
end
