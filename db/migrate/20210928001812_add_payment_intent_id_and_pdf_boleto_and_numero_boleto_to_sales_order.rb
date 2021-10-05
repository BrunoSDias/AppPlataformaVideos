class AddPaymentIntentIdAndPdfBoletoAndNumeroBoletoToSalesOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :sales_orders, :payment_intent_id, :string
    add_column :sales_orders, :pdf_boleto, :string
    add_column :sales_orders, :numero_boleto, :string
  end
end
