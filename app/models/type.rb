class Type < ApplicationRecord
    has_many :varieties

    validates :name, presence: true, uniqueness: true
end
