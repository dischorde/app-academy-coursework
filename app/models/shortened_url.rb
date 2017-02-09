class ShortenedUrl < ActiveRecord::Base
  validates  :user_id, presence: true
  validates  :short_url, uniqueness: true
  validates :long_url, length: { maximum: 1024 }
  validate :over_submission
  validate :submission_count

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

  has_many :taggings,
    class_name: :Tagging,
    primary_key: :id,
    foreign_key: :url_id

  has_many :topics,
    through: :taggings,
    source: :topic

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

  private

  def over_submission
    cur_user = User.find(user_id)
    if cur_user.recent_submission_count > 5
      errors[:submission] << "count can't be greater than 5 within 1 minute"
    end
  end

  def submission_count
    cur_user = User.find(user_id)
    unless cur_user.premium || cur_user.submission_count < 5
      errors[:count] << "of submissions is too high for non-premium users"
    end
  end


end
