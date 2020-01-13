class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table  :invoices do |t|
      t.string    :internal_id,         null: false
      t.string    :external_id,         null: false
      t.date      :disbursement_date
      t.date      :due_date
      t.integer   :counterparty_type
      t.boolean   :is_digitized,        default: false
      t.decimal   :gross_amount,        default: 0.0
      t.decimal   :tax_rate,            default: 0.0
      t.decimal   :tax,                 default: 0.0
      t.integer   :status,              default: Invoice.statuses[:pending]
      t.text      :description,         default: ''

      t.timestamps
    end

    add_index :invoices, :internal_id, unique: true
    add_index :invoices, :external_id, unique: true
  end
end
