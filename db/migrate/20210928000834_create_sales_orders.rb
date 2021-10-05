class CreateSalesOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_orders do |t|
      t.references :client_user, foreign_key: true
      t.references :sales_course, foreign_key: true
      t.string :tipo_pagamento
      t.decimal :valor_total
      t.integer :status

      t.timestamps
    end
  end
end
