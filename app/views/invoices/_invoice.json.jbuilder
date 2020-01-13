json.extract! invoice, :id, :internal_id, :external_id, :disbursement_date, :due_date, :description, :counterparty_type, :is_digitized, :gross_amount, :tax_rate, :tax, :status, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
