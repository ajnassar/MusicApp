class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, :null => false
      t.string :email, :null => false
      t.string :password_digest, :null => false
      t.string :session_token, :null => false
    end

    add_index :users, :user_name, :uniqueness => true
    add_index :users, :email, :uniqueness => true
    add_index :users, :session_token
  end

end
