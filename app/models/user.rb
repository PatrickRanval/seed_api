class User < ApplicationRecord
    has_many :seed_growing_instances
    has_many :user_varieties
    has_many :varieties, through: :user_varieties
    has_many :trays, through: :user_trays
  
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
end
