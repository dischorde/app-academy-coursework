class Album < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :band_id, :kind, presence: true

  belongs_to :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Band

  has_many :tracks,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Track

  def sibling_albums
    self.band.albums
  end
end
