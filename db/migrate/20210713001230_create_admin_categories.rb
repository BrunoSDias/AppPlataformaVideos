class CreateAdminCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_categories do |t|
      t.string :nome

      t.timestamps
    end
  end
end
