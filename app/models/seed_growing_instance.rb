class SeedGrowingInstance < ApplicationRecord
  belongs_to :user
  belongs_to :variety

  validates :user_id, presence: true
  validates :variety_id, presence: true

  #Custom
  validate :harvest_date_after_start_date
  validate :variety_in_user_varieties

  def harvest_date_after_start_date
    return unless start_date.present? && harvest_date.present?
    
    errors.add(:harvest_date, "must be after the start date") if harvest_date <= start_date
  end

  def variety_in_user_varieties
    unless user && user.varieties.include?(variety)
      errors.add(:variety, "must be in the user's varieties")
    end
  end
  
end
