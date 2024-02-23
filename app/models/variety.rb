class Variety < ApplicationRecord
  belongs_to :type
  has_many :listings
  has_many :source_records
  has_many :users, through: :user_varieties
  has_many :vendors, through: :listings
  has_many :sources, through: :source_records

  validates :type_id, presence: true
  validates :name, presence: true, uniqueness: true
end