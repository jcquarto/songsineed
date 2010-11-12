class AddNotesAndStatusToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :notes, :text
    add_column :songs, :found, :boolean, :default => false
  end

  def self.down
    remove_column :songs, :notes
    remove_column :songs, :found
  end
end
