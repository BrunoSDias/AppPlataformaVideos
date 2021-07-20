class RemoveLinkFromSalesCourse < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales_courses, :link, :string
  end
end
