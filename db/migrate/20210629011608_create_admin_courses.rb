class CreateAdminCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_courses do |t|
      t.string :nome
      t.text :descricao
      t.string :link

      t.timestamps
    end
  end
end
