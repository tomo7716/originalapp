class AddTicketCountAndPointsToLessons < ActiveRecord::Migration[7.1]
  def change
    add_column :lessons, :ticket_count, :integer
    add_column :lessons, :points, :integer
  end
end
