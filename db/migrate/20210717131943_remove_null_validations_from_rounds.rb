class RemoveNullValidationsFromRounds < ActiveRecord::Migration[6.1]
  def change
    change_column_null :rounds, :slope, true
    change_column_null :rounds, :rating, true
  end
end
