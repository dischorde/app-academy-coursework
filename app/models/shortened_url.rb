

class ShortenedUrl < ActiveRecord::Base
  validates  :user_id, presence: true, uniqueness: true
  validates  :short_url, uniqueness: true

  belongs_to :submitter,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  def self.random_code
    new_url = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: new_url)
      new_url = SecureRandom.urlsafe_base64
    end
    new_url
  end

  def self.create_for_user_and_long_url!(user, long_url)
    shortened_url = ShortenedUrl.random_code
    ShortenedUrl.create!(user_id: user.id, long_url: long_url,
                         short_url: shortened_url)

  end



end
