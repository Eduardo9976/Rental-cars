class CarCategory < ApplicationRecord
  validates :name, :daily_rate, :insurance, :third_insurance, presence: true
  validates :name, uniqueness: true
end
