class CreateInstitutions < ActiveRecord::Migration[8.0]
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :cnpj
      t.string :type
      t.string :status

      t.timestamps
    end
  end
end
