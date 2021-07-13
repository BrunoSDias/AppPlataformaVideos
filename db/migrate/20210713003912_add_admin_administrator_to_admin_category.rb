class AddAdminAdministratorToAdminCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :admin_categories, :admin_administrator, foreign_key: true
  end
end
