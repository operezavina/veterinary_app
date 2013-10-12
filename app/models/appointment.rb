class Appointment < ActiveRecord::Base
  validate :visit_date_cannot_be_in_the_past
  def visit_date_cannot_be_in_the_past
    if visit_date.present? && visit_date < Date.today
      errors.add(:visit_date, "can't be in the past")
    end
  end
  belongs_to :doctor
  belongs_to :pet
end
