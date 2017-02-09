class FixUsersUpdate < ActiveRecord::Migration
  def change
    remove_column :users, :username
    add_column :users, :username, :string, presence: true, unique: true
  end
end
