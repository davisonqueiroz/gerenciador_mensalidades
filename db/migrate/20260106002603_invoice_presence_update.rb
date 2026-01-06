class InvoicePresenceUpdate < ActiveRecord::Migration[8.0]
  def change
    change_column_null :invoices, :invoice_value, false
    change_column_null :invoices, :due_date, false
    change_column_null :invoices, :status, false
  end
end
