class CreateAdminAdministratorAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_administrator_addresses do |t|
      t.string :rua
      t.integer :numero
      t.string :bairro
      t.integer :cep
      t.string :bairro
      t.string :estado
      t.references :admin_administrators, foreign_key: true

      t.timestamps
    end
  end
end
