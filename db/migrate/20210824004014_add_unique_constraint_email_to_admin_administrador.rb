class AddUniqueConstraintEmailToAdminAdministrador < ActiveRecord::Migration[5.2]
  def change
    add_index :admin_administrators, :email, unique: true
  end
end
