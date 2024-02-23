class Vendor < ApplicationRecord
    has_and_belongs_to_many :sources
    has_many :listings
    has_many :varieties, through: :listings
    
    validates :name, presence: true, uniqueness: true
end
