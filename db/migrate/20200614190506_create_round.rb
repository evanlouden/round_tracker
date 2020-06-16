class CreateRound < ActiveRecord::Migration[6.0]
  def change
    create_table :rounds do |t|
      t.integer :score, null: false
      t.float :rating, null: false, precision: 3, scale: 1
      t.integer :slope, null: false
      t.date :date, null: false
      t.belongs_to :user
      t.belongs_to :course

      t.timestamps
    end
  end
end
