class AuditLog < ApplicationRecord
  belongs_to :user

  validates_presence_of :user, :status, :start_date

  validate :start_date_6_days_prior

  private

  def start_date_6_days_prior
    if start_date != Date.current - 6
      errors.add(:start_date, "it is not valid")
    end
  end

end
