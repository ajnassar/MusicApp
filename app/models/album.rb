class Album < ActiveRecord::Base
  attr_accessible :name, :band_id

  validates :name, :band_id, :presence => true
  belongs_to(
    :band,
    :primary_key => :id,
    :foreign_key => :band_id,
    :class_name => "Band"
  )

  has_many(
    :tracks,
    :primary_key => :id,
    :foreign_key => :album_id,
    :class_name => "Track",
    :dependent => :destroy
  )
end