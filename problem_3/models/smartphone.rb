# frozen_string_literal: true

class Smartphone < ApplicationRecord
  IMEI_FORMAT = /\A\d{15}\z/
  DATE_FORMAT = /\A\d{2}\/\d{2}\/\d{4}\z/

  belongs_to :model
  belongs_to :color

  validates :storage_capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :year_of_manufacture, presence: true, numericality: { only_integer: true }
  validates :os_version, presence: true
  validates :acquisition_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :selling_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :imei_number, presence: true, uniqueness: true, format: { with: IMEI_FORMAT, message: "must be 15 digits" }

  validate :year_not_in_future
  validate :valid_acquisition_date

  private

  def year_not_in_future
    if year_of_manufacture.present? && year_of_manufacture > Date.current.year
      errors.add(:year_of_manufacture, "cannot be in the future")
    end
  end

  def valid_acquisition_date
    if acquisition_date.present?
      unless acquisition_date.match?(DATE_FORMAT)
        errors.add(:acquisition_date, "must be in format dd/mm/yyyy")
        return
      end

      begin
        day, month, year = acquisition_date.split('/')
        parsed_date = Date.new(year.to_i, month.to_i, day.to_i)
        if parsed_date > Date.current
          errors.add(:acquisition_date, "cannot be in the future")
        end
      rescue Date::Error
        errors.add(:acquisition_date, "is not a valid date")
      end
    end
  end
end
