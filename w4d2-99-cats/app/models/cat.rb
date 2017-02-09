class Cat < ActiveRecord::Base
  CAT_COLORS = %w(white black orange tabby silver calico).freeze

  validates :name, :birth_date, :sex, :color, presence: true
  validates :sex, inclusion: { in: %w(M F) }
  validates :color, inclusion: { in: CAT_COLORS }

  has_many :cat_rental_requests

  def age
    Time.now.year - birth_date.year
  end


end
