class CreateLessons < ActiveRecord::Migration[7.1]
  def change
    create_table :lessons do |t|
      t.references :student, null: false, foreign_key: true
      t.string :classroom_name
      t.date :date
      t.string :course
      t.string :type

      t.timestamps
    end
  end
end
