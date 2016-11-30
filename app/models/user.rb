class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many :submitted_urls,
    class_name: :ShortenedUrl,
    primary_key: :id,
    foreign_key: :user_id

  has_many :visits,
    class_name: :Visit,
    primary_key: :id,
    foreign_key: :user_id

  has_many :visited_urls,
    through: :visits,
    source: :url

  has_many :uniq_visited_urls,
    -> { distinct },
    through: :visits,
    source: :url

end
