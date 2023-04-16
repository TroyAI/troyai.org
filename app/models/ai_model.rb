class AiModel < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  validates :score, 
    comparison: { less_than_or_equal_to: 1, message: "must be between 0 and 1 (inclusive)" },
    comparison: { greater_than_or_equal_to: 0, message: "must be between 0 and 1 (inclusive)" }
end
