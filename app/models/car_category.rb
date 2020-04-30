class CarCategory < ApplicationRecord
  has_many :rentals
  has_many :car_models
  validates :name, :daily_rate, :insurance, :third_insurance, presence: true
  validates :name, uniqueness: true
  validates :daily_rate, :insurance, :third_insurance, numericality: { only_integer: true, greater_than: 0}
end
