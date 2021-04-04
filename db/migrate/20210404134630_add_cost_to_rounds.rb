class AddCostToRounds < ActiveRecord::Migration[6.1]
  def change
    add_column :rounds, :cost, :decimal
  end
end
