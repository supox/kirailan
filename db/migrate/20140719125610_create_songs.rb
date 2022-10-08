class CreateSongs < ActiveRecord::Migration[4.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.integer :song_type

      t.timestamps
    end
  end
end
