class RenameTypeToLessonTypeInLessons < ActiveRecord::Migration[7.1]
  def change
    rename_column :lessons, :type, :lesson_type
  end
end
