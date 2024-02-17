class SourceRecord < ApplicationRecord
  belongs_to :source
  has_one :variety
end
