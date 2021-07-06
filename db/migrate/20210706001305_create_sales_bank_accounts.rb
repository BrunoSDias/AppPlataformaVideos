class CreateSalesBankAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_bank_accounts do |t|
      t.integer :conta
      t.integer :agencia
      t.integer :banco
      t.references :sales_seller, foreign_key: true

      t.timestamps
    end
  end
end
