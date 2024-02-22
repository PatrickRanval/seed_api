class Listing < ApplicationRecord
  belongs_to :variety
  belongs_to :vendor

  validates :variety_id, presence: true
  validates :vendor_id, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :organic_status, inclusion: { in: [true, false] }
end
