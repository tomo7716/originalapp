class Student < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_many :lessons, dependent: :destroy
  has_many :point_exchanges


  def last_lesson_date
    lessons.maximum(:date)
  end

  def total_points
    point_exchanges.sum(:points)
  end
end