class AddUniqueConstraintToSalesSeller < ActiveRecord::Migration[5.2]
  def change
    add_index :sales_addresses, [:numero, :cep], unique: true
  end
end
