class ChangeColumnToUsers < ActiveRecord::Migration
  def change

    User.all.each do |user|
      user.is_admin = false
      user.save
    end

    change_column_null :users, :is_admin, false

    change_column :users, :is_admin, :boolean, :null => false, :default => false

  end

end
