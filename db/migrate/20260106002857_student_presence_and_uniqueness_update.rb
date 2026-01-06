class StudentPresenceAndUniquenessUpdate < ActiveRecord::Migration[8.0]
  def change
    change_column_null :students, :name, false
    change_column_null :students, :cpf, false
    change_column_null :students, :gender, false
    change_column_null :students, :payment_method, false
    add_index :students, :cpf, unique: true
  end
end
