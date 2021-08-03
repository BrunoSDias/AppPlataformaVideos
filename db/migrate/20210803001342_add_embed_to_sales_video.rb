class AddEmbedToSalesVideo < ActiveRecord::Migration[5.2]
  def change
    add_column :sales_videos, :embed, :text
  end
end
