class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :galaxy

  validates :start_date, :end_date, presence: true

  validate :end_date_after_start_date
  validate :rent_too_long

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "is invalid. It must be after the start date.")
    elsif end_date == start_date
      errors.add(:end_date, "is invalid. Rental must be for at least one day")
    end
  end

  def rent_too_long
    if end_date > start_date + 30.days
      errors.add(:end_date, "is too great. You can only rent for 30 days at a time.")

    end
  end
end
