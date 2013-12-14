class CreateBandBandTrack < ActiveRecord::Migration

  create_table :band do |t|
    t.string :name
    t.integer :album_id
    t.integer :band_id
    t.timestamps
  end

  create_table :album do |t|
    t.string :name
    t.integer :band_id

    t.timestamps
  end

  create_table :track do |t|
    t.string :name
    t.integer :album_id

    t.timestamps
  end

end
