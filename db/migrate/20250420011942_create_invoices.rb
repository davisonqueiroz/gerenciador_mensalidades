class CreateInvoices < ActiveRecord::Migration[8.0]
  def change
    create_table :invoices do |t|
      t.decimal :invoice_value
      t.date :due_date
      t.references :enrollment, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
