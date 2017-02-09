class AddColumnsToCatRentalRequest < ActiveRecord::Migration
  def change
    add_column :cat_rental_requests, :cat_id, :integer,
      null: false
    add_column :cat_rental_requests, :start_date, :date, null: false
    add_column :cat_rental_requests, :end_date, :date, null: false
    add_column :cat_rental_requests, :status, :string,
      null: false, default: "PENDING"

    add_index(:cat_rental_requests, :cat_id)
  end
end
