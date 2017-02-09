class User < ActiveRecord::Base
<<<<<<< HEAD
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

  def recent_submission_count
    self.submitted_urls.where(["shortened_urls.updated_at > ?", 1.minutes.ago]).count
  end

  def submission_count
    self.submitted_urls.count
  end

  def create_shortened_url(long_url)
    ShortenedUrl.create_for_user_and_long_url!(self, long_url)
  end

=======

  has_many :enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Enrollment

  has_many :enrolled_courses,
    through: :enrollments,
    source: :course
>>>>>>> associations/master
end
