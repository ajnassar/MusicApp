class RemoveBandColumns < ActiveRecord::Migration
  def change
    remove_column :bands, :album_id
    remove_column :bands, :band_id
  end
end
