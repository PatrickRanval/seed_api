class User < ApplicationRecord
    has_many :varieties
    has_many :seed_growing_instances
end
