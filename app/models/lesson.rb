class Lesson < ApplicationRecord
  belongs_to :student

  validates :ticket_count, numericality: { greater_than_or_equal_to: 0 }
  validates :points, numericality: { greater_than_or_equal_to: 0 }
end
