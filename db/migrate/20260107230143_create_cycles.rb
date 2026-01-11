class CreateCycles < ActiveRecord::Migration[8.0]
  def change
    create_table :cycles do |t|
      t.integer :index
      t.string :status
      t.decimal :value
      t.datetime :due_date

      t.timestamps
    end
  end
end
