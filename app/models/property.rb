class Property < ApplicationRecord
  has_many :nearest_stations, dependent: :destroy
  accepts_nested_attributes_for :nearest_stations, reject_if: :all_blank, allow_destroy: true
end
