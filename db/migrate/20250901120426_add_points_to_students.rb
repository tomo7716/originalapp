class AddPointsToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :points, :integer
  end
end
