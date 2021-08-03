class CreateClientUsersCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :client_users_courses do |t|
      t.references :client_user, foreign_key: true
      t.references :sales_course, foreign_key: true

      t.timestamps
    end
  end
end
