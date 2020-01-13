class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table  :line_items do |t|
      t.integer   :invoice_id
      t.integer   :category_id
      t.decimal   :quantity,      default: 0.0
      t.decimal   :unit_price,    default: 0.0
      t.decimal   :amount,        default: 0.0

      t.timestamps
    end
  end
end
