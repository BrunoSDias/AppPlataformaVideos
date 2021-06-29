class CreateAdminAdministrators < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_administrators do |t|
      t.string :nome
      t.string :telefone
      t.string :cpf

      t.timestamps
    end
  end
end
