class AddPrecoToSalesCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :sales_courses, :preco, :decimal
  end
end
