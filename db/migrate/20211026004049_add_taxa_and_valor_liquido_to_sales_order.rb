class AddTaxaAndValorLiquidoToSalesOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :sales_orders, :taxa, :decimal
    add_column :sales_orders, :valor_liquido, :decimal
  end
end
