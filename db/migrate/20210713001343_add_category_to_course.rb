class AddCategoryToCourse < ActiveRecord::Migration[5.2]
  def change
    add_reference :sales_courses, :admin_category, foreign_key: true
  end
end
