# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime
#  updated_at :datetime
#

class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED),
    message: "%{value} is not a valid status"}
  validate :overlapping_approved_requests

  def overlapping_requests(other_request)

    (self[:start_date]..self[:end_date]).overlaps?(other_request.start_date..other_request.end_date)
  #   CatRentalRequest
  # .where.not(id: self.id)
  # .where(cat_id: cat_id)
  # .where(<<-SQL, start_date: start_date, end_date: end_date)
  #    NOT( (start_date > :end_date) OR (end_date < :start_date) )
  # SQL
  end

  def overlapping_approved_requests
    CatRentalRequest.all.each do |request|
      if overlapping_requests(request) && request.status == "APPROVED"
        errors[:overlapping_errors] << "Overlaps with existing request"
      end

    end
    #  overlapping_requests.where("status = 'APPROVED'")

  end

  belongs_to :cat
end
