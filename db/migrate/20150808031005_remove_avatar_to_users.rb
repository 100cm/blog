class RemoveAvatarToUsers < ActiveRecord::Migration
  def change
    remove_column :users ,:avatar, :string
  end
end
