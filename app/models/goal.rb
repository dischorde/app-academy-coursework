class Goal < ActiveRecord::Base
  validates :title, :status, :user, :privacy, presence: true
  validates :privacy, inclusion: %w(public private)
  validates :status, inclusion: %w(Ongoing Complete)

  belongs_to :user
end
