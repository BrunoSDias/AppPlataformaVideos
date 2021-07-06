class ChangeTelefoneToSalesSeller < ActiveRecord::Migration[5.2]
  def down
    change_column :sales_sellers, :telefone, :integer
  end

  def up
    change_column :sales_sellers, :telefone, :bigint
  end
end
