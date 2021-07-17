class AddHolesToRound < ActiveRecord::Migration[6.1]
  def change
    add_column :rounds, :holes, :integer, default: 18
  end
end
