class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :cpf
      t.date :date_of_birth
      t.integer :cellphone
      t.string :gender
      t.string :payment_method

      t.timestamps
    end
  end
end
