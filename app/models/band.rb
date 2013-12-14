class Band < ActiveRecord::Base
  attr_accessible :name, :album_id, :track_id

  has_many(
    :albums,
    :primary_key => :id,
    :foreign_key => :band_id,
    :class_name => "Album"
  )

  has_many(
    :tracks,
    :through => :albums,
    :source => :tracks
  )


end