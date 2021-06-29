class CreateAdminBankAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_bank_accounts do |t|
      t.integer :numero
      t.integer :agencia
      t.integer :banco
      t.references :admin_administrator

      t.timestamps
    end
  end
end
