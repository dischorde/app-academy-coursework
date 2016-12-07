class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validate :overlaps, :logical_dates

  belongs_to :cat, dependent: :destroy

  def approve!
    self.status = 'APPROVED'

    transaction do
      self.save
      overlapping_pending_requests.each(&:deny!)
    end
  end

  def deny!
    self.status = 'DENIED'
    self.save
  end

  def pending?
    self.status == 'PENDING'
  end

  private

  def logical_dates
    if self.start_date > self.end_date
      self.errors[:Illogical_dates] << ": Start date should be before End date."
    end
  end

  def overlaps
    if overlapping_approved_requests? && self.status == 'APPROVED'
      self.errors[:overlaps] << "with other approved request."
    end
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: 'PENDING')
  end

  def overlapping_approved_requests?
    overlapping_requests.exists?(status: 'APPROVED')
  end

  def overlapping_requests
    CatRentalRequest.where(cat_id: self.cat_id)
    .where.not(id: self.id)
    .where(<<-SQL, start: self.start_date, final: self.end_date)
    start_date BETWEEN :start AND :final
    OR end_date BETWEEN :start AND :final
    OR (
      start_date < :start AND end_date > :final
    )
    SQL
  end

end
