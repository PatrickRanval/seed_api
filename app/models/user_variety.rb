class UserVariety < ApplicationRecord
    belongs_to :user
    belongs_to :variety
  end