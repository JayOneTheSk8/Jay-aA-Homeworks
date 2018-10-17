class CreateUpdateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :update_users do |t|
    end
    add_index :users, :username, unique: true
    add_index :users, :session_token, unique: true
  end
end
