class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validate :overlaps

  belongs_to :cat, dependent: :destroy




  private

  def overlaps
    if overlapping_approved_requests? && self.status == 'APPROVED'
      self.errors[:overlaps] << "with other approved request."
    end
  end

  def overlapping_approved_requests?
    overlapping_requests.any? { |request| request.status == 'APPROVED' }
  end

  def overlapping_requests
    all_requests = self.cat.cat_rental_requests.where.not(id: self.id)

    all_requests.select do |request|
      start_date.between?(request.start_date, request.end_date) ||
      end_date.between?(request.start_date, request.end_date)
    end
  end

end
