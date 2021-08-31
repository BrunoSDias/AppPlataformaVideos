class AddUniqueConstraintToClientUser < ActiveRecord::Migration[5.2]
  def change
    add_index :client_users, :cpf, unique: true
    add_index :client_users, :email, unique: true
  end
end
