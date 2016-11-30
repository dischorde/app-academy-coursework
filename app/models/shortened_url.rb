class ShortenedUrl < ActiveRecord::Base
  validates  :user_id, presence: true, uniqueness: true
  validates  :short_url, uniqueness: true

  belongs_to :submitter,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  has_many :visits,
    class_name: :Visit,
    primary_key: :id,
    foreign_key: :url_id

  has_many :visitors,
    through: :visits,
    source: :visitor

  has_many :uniq_visitors,
    -> { distinct },
    through: :visits,
    source: :visitor

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

  def num_clicks
    self.visitors.count
  end

  def num_uniques
    self.uniq_visitors.count
  end

  def num_recent_uniques
    self.uniq_visitors.where(["visits.updated_at > ?", 10.minutes.ago]).count
  end

end
