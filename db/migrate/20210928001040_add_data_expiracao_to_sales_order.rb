class AddDataExpiracaoToSalesOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :sales_orders, :data_expiracao, :datetime
  end
end
