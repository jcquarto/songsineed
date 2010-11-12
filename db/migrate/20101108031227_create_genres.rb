class CreateGenres < ActiveRecord::Migration
  def self.up
    create_table :genres do |t|
      t.string :name

      t.timestamps
    end
    
    create_table :genres_songs, :id => false do |t|
      t.integer :genre_id
      t.integer :song_id
    end
  end

  def self.down
    drop_table :genres
    drop_table :genres_songs
  end
end
