# app/models/student.rb
class Student < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_many :lessons, dependent: :destroy

  def last_lesson_date
    lessons.maximum(:date)
  end
end