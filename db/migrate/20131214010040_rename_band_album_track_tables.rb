class RenameBandAlbumTrackTables < ActiveRecord::Migration
  def change
    rename_table :band, :bands
    rename_table :album, :albums
    rename_table :track, :tracks
  end
end
