class CreatePointExchanges < ActiveRecord::Migration[7.1]
  def change
    create_table :point_exchanges do |t|
      t.references :student, null: false, foreign_key: true
      t.integer :points
      t.string :description

      t.timestamps
    end
  end
end
