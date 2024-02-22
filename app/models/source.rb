class Source < ApplicationRecord
    has_and_belongs_to_many :vendors
    has_many :source_records
    has_many :varieties, through: :source_records

    validates :name, presence: true
end
