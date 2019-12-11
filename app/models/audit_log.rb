class AuditLog < ApplicationRecord
  enum status: { pending: 0, confirmed: 1 }

  belongs_to :user

  validates_presence_of :user, :status, :start_date

  after_initialize :set_defaults
  # validate :start_date_6_days_prior

  private

  def set_defaults
    self.start_date ||= Date.today - 6.days
  end
  # def start_date_6_days_prior
  #   if start_date != Date.current - 6
  #     errors.add(:start_date, "it is not valid")
  #   end
  # end

end
