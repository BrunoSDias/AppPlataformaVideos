class CreateSalesCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_courses do |t|
      t.string :nome
      t.string :descricao
      t.string :link
      t.references :sales_seller

      t.timestamps
    end
  end
end
