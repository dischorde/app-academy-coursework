class Track < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :album_id, :kind, presence: true

  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Album

  has_one :band,
    through: :album,
    source: :band

  has_many :notes
end
