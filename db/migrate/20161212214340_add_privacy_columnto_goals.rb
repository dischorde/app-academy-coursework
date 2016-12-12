class AddPrivacyColumntoGoals < ActiveRecord::Migration
  def change
    add_column :goals, :privacy, :string
  end
end
