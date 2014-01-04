class AddUsernameAndNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, default: '', null: false, limit: 20
    add_column :users, :name, :string
    add_index :users, :username, unique: true
  end
end
