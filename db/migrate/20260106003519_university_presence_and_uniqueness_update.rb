class UniversityPresenceAndUniquenessUpdate < ActiveRecord::Migration[8.0]
  def change
    change_column_null :universities, :name, false
    add_index :universities, [:name, :cnpj], unique: true
  end
end
