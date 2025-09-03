class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :students, inverse_of: :user, dependent: :destroy
  accepts_nested_attributes_for :students, allow_destroy: true

  validate :must_have_at_least_one_student
  validates :name, presence: true
  private

  def must_have_at_least_one_student
    if students.blank? || students.all? { |s| s.marked_for_destruction? || s.name.blank? }
      errors.add(:base, "生徒は1名以上登録してください")
    end
  end
end
