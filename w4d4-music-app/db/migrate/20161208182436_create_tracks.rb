class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :kind, null: false, default: 'regular'
      t.text :lyrics

      t.timestamps null: false
    end

    add_index :tracks, :album_id, unique: true
  end
end
