class AddUniqueConstraintCpfToAdminAdministrador < ActiveRecord::Migration[5.2]
  def change
    add_index :admin_administrators, :cpf, unique: true
  end
end
