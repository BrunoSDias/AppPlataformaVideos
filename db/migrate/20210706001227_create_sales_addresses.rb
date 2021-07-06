class CreateSalesAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_addresses do |t|
      t.string :rua
      t.integer :numero
      t.string :estado
      t.string :cep
      t.string :bairro
      t.references :sales_seller, foreign_key: true

      t.timestamps
    end
  end
end
