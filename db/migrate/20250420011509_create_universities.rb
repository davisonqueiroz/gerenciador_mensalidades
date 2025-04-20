class CreateUniversities < ActiveRecord::Migration[8.0]
  def change
    create_table :universities do |t|
      t.string :name
      t.string :cnpj
      t.string :type

      t.timestamps
    end
  end
end
