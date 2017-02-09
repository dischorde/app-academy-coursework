class UpdateVisits < ActiveRecord::Migration
  def change
    remove_index :visits, :user_id
    remove_index :visits, :url_id
    add_index :visits, :user_id
    add_index :visits, :url_id
  end
end
