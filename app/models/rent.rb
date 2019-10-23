class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :galaxy

  validates :start_date, :end_date, presence: true

  validate :end_date_after_start_date, :rent_too_long, :rent_is_within_next_year

  def total_days
    check_in = Date.parse(start_date.to_s)
    check_out = Date.parse(end_date.to_s)
    (check_out - check_in).to_i
  end

  def total_price
    total_days * galaxy.price
  end

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
    return if end_date.blank? || start_date.blank?

    if end_date > start_date + 30.days
      errors.add(:end_date, "must be less than 31 days from start date.")
    end
  end

  def rent_is_within_next_year
    return if end_date.blank? || start_date.blank?

    if end_date > 365.days.from_now
      errors.add(:end_date, "must be less than a year from now.")
    end
  end
end
