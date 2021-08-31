class AddUniqueConstraintsToAdminCategory < ActiveRecord::Migration[5.2]
  def change
    add_index :admin_categories, :nome, unique: true
  end
end
