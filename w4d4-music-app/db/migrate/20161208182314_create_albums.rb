class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :kind, null: false, default: 'live'
      t.string :name, null: false
      t.timestamps null: false
    end

    add_index :albums, :band_id, unique: true
    add_index :albums, :name
  end
end
