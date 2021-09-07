class AddConcluidoToClientUsersCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :client_users_courses, :concluido, :boolean, default: false
  end
end
