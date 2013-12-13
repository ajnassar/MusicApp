class AddUniqueToUserEmail < ActiveRecord::Migration
  def change

    change_column :users, :user_name, :string, :unique => true
    change_column :users, :email, :string, :unique => true
  end
end
