class SourceRecord < ApplicationRecord
  belongs_to :source
  belongs_to :variety

  validates :source_id, presence: true
  validates :variety_id, presence: true
end
