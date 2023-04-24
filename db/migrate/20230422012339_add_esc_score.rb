class AddEscScore < ActiveRecord::Migration[7.0]
  def change
    add_column :rounds, :esc_score, :integer
  end
end
