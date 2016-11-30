class ShortenedUrl < ActiveRecord::Base
  validates :short_url, :user_id, presence: true, uniqueness: true

end
