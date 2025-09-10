class AddStatusToPointExchanges < ActiveRecord::Migration[7.1]
  def change
    add_column :point_exchanges, :status, :string, default: "pending", null: false
  end
end
