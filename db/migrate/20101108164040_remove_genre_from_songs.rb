class RemoveGenreFromSongs < ActiveRecord::Migration
  def self.up
    # moves to many-to-many with songs/genres so removing genre field from songs
    remove_column :songs, :genre
  end

  def self.down
    add_column :songs, :genre, :string
  end
end
