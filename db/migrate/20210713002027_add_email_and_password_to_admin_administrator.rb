class AddEmailAndPasswordToAdminAdministrator < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_administrators, :email, :string
    add_column :admin_administrators, :password_digest, :string
  end
end
