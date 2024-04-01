class Tray < ApplicationRecord

    has_many :user_trays
    has_many :users, through: :user_trays
    
    # Validation for valid plug tray configurations 512 cells (16x32) is the largest I'm aware of.   
    validates :name, presence: true
    validates :cells_short, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 32 }
    validates :cells_long, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 32 }
    validate :cells_long_greater_than_cells_short
  
    private
    
    # Custom validation ensures denotation of tray is always entered correctly
    def cells_long_greater_than_cells_short
      if cells_long.present? && cells_short.present? && cells_long < cells_short
        errors.add(:cells_long, "must be greater than or equal to cells_short")
      end
    end
  end
