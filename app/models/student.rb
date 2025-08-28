# app/models/student.rb
class Student < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
end